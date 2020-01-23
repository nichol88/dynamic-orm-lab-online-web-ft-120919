require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'interactive_record.rb'

class Student < InteractiveRecord

  attr_accessor :id, :name, :grade

  def initialize(attributes = [])
    attributes.each { |a, v| self.send("#{a}=", v)}
  end
end
