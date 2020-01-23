require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'interactive_record.rb'

class Student < InteractiveRecord

  def initialize(attributes)
    attributes.each { |a, v| self.send("#{a}=", v)}
  end
end
