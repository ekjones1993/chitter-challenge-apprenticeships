require 'pg'
require_relative 'database_connection'

class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY date DESC;")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        message: peep['message'],
        date: peep['date']
      )
    end
  end

  def self.create(message:, date:)
    result = DatabaseConnection.query("INSERT INTO peeps (message, date) VALUES('#{message}','#{date}') RETURNING id, message, date")
    Peep.new(
      id: result[0]['id'],
      message: result[0]['message'],
      date: result[0]['date'])
  end

  def self.search(keyword:)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE (message) LIKE '%#{keyword}%' ORDER BY date DESC")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        message: peep['message'],
        date: peep['date']
      )
    end
  end

  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @id  = id
    @message = message
    @date = date
  end

end
