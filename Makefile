.PHONY: run dev build mocha

dev:
	NDOE_ENV=development \
	PORT=3000 \
	coffee ./config/web.coffee

run:
	NODE_ENV=production \
	PORT=3000 \
	coffee ./config/web.coffee

build:
	grunt build

mocha:
	NODE_ENV=test \
	./node_modules/.bin/mocha \
	--reporter nyan \
	--compilers coffee:coffee-script \
	--check-leaks \
	--slow 20 \
	tests

