require File.dirname(__FILE__) + "/../lib/timestamped_boolean"

require 'rubygems'
require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database  => ':memory:'
ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do
  create_table :users, :force => true do |t|
    t.boolean  :foo
    t.datetime :foo_changed_at
    
    t.string :name
    t.datetime :name_changed_at
    
    t.timestamps
  end
end

class User < ActiveRecord::Base
end
