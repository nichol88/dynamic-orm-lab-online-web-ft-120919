require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'interactive_record.rb'

class Student < InteractiveRecord

  self.column_names.each do |col_name|
    attr_accessor col_name.to_sym
  end

  def initialize(attributes = {})
    attributes.each{|a,v| self.send("#{a}=", v) }
  end

  def table_name_for_insert
    self.class.table_name
  end

  def col_names_for_insert
    self.class.column_names.delete_if{|e| e == 'id'}.join(', ')
  end

  def values_for_insert
    values_array = []
    self.class.column_names.each do |col_name|
      values_array << "'#{self.send(col_name)}'" unless send(col_name).nil?
    end
    values_array.join(', ')
  end

  def save
    sql = <<-SQL
    INSERT INTO #{table_name_for_insert} (#{col_names_for_insert[0]} , #{col_names_for_insert[1]})
    VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, , col_names_for_insert[1], values_for_insert[0], values_for_insert[1])
  end

end
