require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        #{self.table_name}
      SQL
    
    cols.map!(&:to_sym)
    @columns = cols
  end

  def self.finalize!
    self.columns.each do |attribute|
      #Getter
      define_method(attribute) do
        # self.instance_variable_get("@#{attribute}")
        self.attributes[attribute]
      end
      
      #Setter
      define_method("#{attribute}=") do |options|
      # self.instance_variable_set("@#{attribute}", options)
      self.attributes[attribute] = options
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end


  def self.table_name
    "#{self}s".downcase 
  end

  def self.all
    query = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    parse_all(query)
  end

  def self.parse_all(results)
    results.map { |result| self.new(result)}
  end

  def self.find(id)
    query = DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        #{table_name}.id = ?

    SQL
    parse_all(query).first
  end

  def initialize(params = {})
    params.each do |attribute, value|

      attr_sym = attribute.to_sym
      columns = self.class.columns

      if columns.include?(attr_sym)
        self.send("#{attr_sym}=", value)
      else
        raise "unknown attribute '#{attr_sym}'" 
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
