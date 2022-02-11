install: 
	bundle install

lint:
	bundle exec rubocop .

la:
	bundle exec rubocop -A .

test:
	rake test