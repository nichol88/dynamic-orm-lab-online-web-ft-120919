require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'interactive_record.rb'

class Student < InteractiveRecord

  attr_accessor :id, :name, :grade

  def initialize(attributes = [])
    column_names.each do |col_name

    end
  end
end
