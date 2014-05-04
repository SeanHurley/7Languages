module ActsAsCsv
  class CsvRow
    def initialize(headers, row)
      @headers = headers
      @row = row
    end

    def inspect
      @row.inspect
    end

    def to_s
      @row.to_s
    end

    def method_missing(method, *args, &block)
      index = @headers.index(method.to_s)
      if index
        @row[index]
      else
        super
      end
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + ".txt"

      File.open(filename, "r") do |file|
        @headers = file.gets.chomp.split(", ")

        file.each do |row|
          items = row.chomp.split(", ")
          @csv_contents << CsvRow.new(@headers, items)
        end
      end
    end

    def each
      @csv_contents.each do |row|
        yield row
      end
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
p csv.headers
p csv.csv_contents

p "#"*30

csv.each { |row| p row }
csv.each { |row| p row.one }
