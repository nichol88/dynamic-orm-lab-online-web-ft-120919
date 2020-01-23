require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    info = DB[:conn].execute("PRAGMA table_info(#{table_name})")
    info.map { |col_info_hash| col_info_hash['name'] }
  end

  self.column_names.each do |col_name|
    attr_accessor col_name.to_sym
  end
end
