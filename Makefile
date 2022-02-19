install: 
	bundle install

lint:
	bundle exec rubocop .

la:
	bundle exec rubocop -A .

tests:
	rake test
