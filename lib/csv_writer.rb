# frozen_string_literal: true

require 'csv'

class CSVWriter
  def write(data)
    CSV.open('./test.csv', 'a+') do |csv|
      data.each { |row| csv << row }
    end
  end
end
