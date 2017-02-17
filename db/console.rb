require('pry')
require_relative('../models/ticket.rb')
require_relative('../models/film.rb')
require_relative('../models/customer.rb')

Ticket.delete_all
Film.delete_all
Customer.delete_all

#films
@film1 = Film.new({'title' => 'The Wolf Man', 'price' => 11})
@film1.save

@film2 = Film.new({'title' => 'An American Werewolf in London', 'price' => 12})
@film2.save

@film3 = Film.new({'title' => 'The Howling', 'price' => 12})
@film3.save

#customers
@customer1 = Customer.new({'name' => 'Marsha', 'funds' => 13})
@customer1.save

@customer2 = Customer.new({'name' => 'Lawrence', 'funds' => 123})
@customer2.save

@customer3 = Customer.new({'name' => 'David', 'funds' => 10})
@customer3.save

#tickets
@ticket1 = Ticket.new({'film_id' => @film2.id, 'customer_id' => @customer1.id, 'time' => '20:00'})
@ticket1.save

@ticket2 = Ticket.new({'film_id' => @film2.id, 'customer_id' => @customer2.id, 'time' => '20:00'})
@ticket2.save

@ticket3 = Ticket.new({'film_id' => @film3.id, 'customer_id' => @customer3.id, 'time' => '19:00'})
@ticket3.save

@ticket4 = Ticket.new({'film_id' => @film2.id, 'customer_id' => @customer3.id, 'time' => '00:00'})
@ticket3.save

binding.pry
nil