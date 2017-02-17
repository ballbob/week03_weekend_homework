require('../db/sql_runner.rb')

class Customer
  attr_reader :name, :id
  attr_accessor :funds

  def initialize(options)
    @name = options['name']
    @funds = options['funds'].to_i
    @id = options['id'].to_i if options['id']
  end

end