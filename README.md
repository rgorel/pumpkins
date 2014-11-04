# Pumpkins API

Example app presented on [kiev.rb #3](http://kiev-rb.com.ua/) by Roman Gorel

## Installation

```
$ echo '127.0.0.1 api.pumpkins.ua' | sudo tee -a /etc/hosts 
$ git submodule init
$ git submodule update
$ cd ruby-jwt/
$ bundle
$ rake build_gemspec
$ cd ..
$ bundle
$ rake db:setup
$ rails s
```

### Note
Submodules and build gemspec for ruby-jwt is needed to get the cutting edge JWT version with expiration support. It's not yet uploaded to rubygems.org at the moment of writing.
