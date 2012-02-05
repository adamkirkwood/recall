Recall.rb
=============

A simple URL shortening service based on Sinatra and Redis.

Routes
-------

Redirect requires a token param.

  GET /:token

Creating a new short URL requires a :url query param.

  POST /new
  

Setup
-----

    gem install sinatra
    gem install rspec
    gem install redis


Usage
-----

    sinatra recall.rb

I prefer to use Shotgun during development:

    shotgun 'github/markup'
    
Then make sure you have your redis server running:

    redis-server


Testing
-------

This project uses RSpec.

To run the tests:

    $ rake

To add tests see the `Commands` section earlier in this
README.


Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b my_markup`)
3. Commit your changes (`git commit -am "Added Snarkdown"`)
4. Push to the branch (`git push origin my_markup`)
5. Create an [Issue][1] with a link to your branch
6. Enjoy a refreshing Diet Coke and wait


[r2h]: http://github.com/github/markup/tree/master/lib/github/commands/rest2html
[r2hc]: http://github.com/github/markup/tree/master/lib/github/markups.rb#L13
[1]: http://github.com/github/markup/issues