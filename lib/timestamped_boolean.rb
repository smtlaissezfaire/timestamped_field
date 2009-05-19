module TimestampedBoolean
  def self.included(mod)
    mod.extend ClassMethods
  end

  module Version
    MAJOR = 0
    MINOR = 0
    TINY  = 1
    
    STRING = "#{MAJOR}.#{MINOR}.#{TINY}"
  end

  module ClassMethods
    def timestamped_boolean(field)
      define_method "#{field}=" do |val|
        write_attribute(field, val)
        self.send("#{field}_changed_at=", Time.now)
      end
    end
  end
end
