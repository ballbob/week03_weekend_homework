require('pry')
require_relative('../models/ticket.rb')
require_relative('../models/ticket.rb')
require_relative('../models/ticket.rb')

Ticket.delete_all
Film.delete_all
Customer.delete_all

#films
@film1 = Film.new({'name' => 'The Wolf Man', 'price' => 11})
film1.save

@film2 = Film.new({'name' => 'An American Werewolf in London', 'price' => 12})
@film2.save

@film3 = Film.new({'name' => 'The Howling', 'price' => 12})
@film3.save

#customers
@customer1 = Customer.new({'name' => 'Marsha', 'funds' => 13})
@customer1.save

@customer2 = Customer.new({'name' => 'Lawrence', 'funds' => 123})
@customer2.save

@customer3 = Customer.new({'name' => 'David', 'funds' => 10})
@customer3.save

#tickets
@ticket1 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer1.id, 'time' => '20:00'})

@ticket2 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer2.id, 'time' => '20:00'})

binding.pry
nil