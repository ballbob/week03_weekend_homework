require_relative('../db/sql_runner.rb')

class Customer
  attr_reader :name, :id
  attr_accessor :funds

  def initialize(options)
    @name = options['name']
    @funds = options['funds'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO customers
    (name,funds)
    VALUES
    ('#{@name}',
    '#{@funds}')
    RETURNING *;"
    firstresult = SqlRunner.run(sql)
    resultobject = firstresult.map { |customer| Customer.new(customer)}
    idasstring = resultobject[0].id
    @id = idasstring.to_i
  end

  def display
  end

  def self.display_all
  end

  def update
  end

  def delete
  end

  def self.delete_all
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

end