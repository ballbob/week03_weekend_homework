require_relative('../db/sql_runner.rb')

class Ticket

  attr_reader :id, :film_id, :customer_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id']
    @customer_id = options['customer_id']
    @time = options['time']
  end

end