require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    info = DB[:conn].execute("PRAGMA table_info(#{table_name})")
    info.each do |col_info_hash|

    end
  end
end
