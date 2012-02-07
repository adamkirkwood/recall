Recall.rb
=============

[![Build Status](https://secure.travis-ci.org/adamkirkwood/recall.png)](http://travis-ci.org/adamkirkwood/recall)

A simple URL shortening service based on [Sinatra][sin] and [Redis][redis].

Routes
-------

Redirect requires a token param.

    GET /:token

Creating a new short URL requires a :url query param.

    POST /new
  

Setup
-----

    bundle install


Usage
-----

    sinatra recall.rb

I prefer to use [Shotgun][sg] during development:

    shotgun 'github/markup'
    
Then make sure you have your redis server running:

    $ redis-server


Testing
-------

This project uses RSpec and autotest.

To run the tests:

    $ rspec

Or, have autotest run your tests once it detects any of your specs have changed.

    $ autotest


Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b my_markup`)
3. Commit your changes (`git commit -am "Added Snarkdown"`)
4. Push to the branch (`git push origin my_markup`)
5. Create an [Issue][1] with a link to your branch
6. Enjoy a refreshing Diet Coke and wait


[sin]: http://sinatrarb.com
[redis]: http://redis.io
[sg]: https://github.com/rtomayko/shotgun/
[1]: http://github.com/adamkirkwood/recall/issues