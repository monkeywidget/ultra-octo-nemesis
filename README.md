ruby-octo-nemesis
=================

Turing-complete Lights-Out variant with rules engine
Support for:
- stateless front end clients
- server logic running in ruby on Raspberry Pi.  Support for GPIO pins for lights/buttons


Architecture Notes
==================

To-Do
-----

- implement stubs to represent matrix hardware and specs


Server layer
------------

Rules Engine
- REST
- stateless
- JSON in, JSON out
     - JSON in: rules set name, current grid state, incoming event
     - JSON out: next grid state
- supports many different rules engines

Grid State
- JSON in, JSON out
    - JSON in: incoming event
    - JSON out: next grid state


How To Install
==============

Install on dev system
---------------------

- install rvm
- install bundler
- install gems for this project

     bundle install


Install on RPi
--------------

- install ruby
- recommended: install screen
  - sudo apt-get install screen
- install rvm
- install bundler
- install gems for this project

     bundle install


How To Test
===========

Run rspec on your development system (not the pi)

    bundle exec rspec


Run on Pi
---------


Client Hardware requirements
----------------------------

TBD: Details on what the button matrix / LED grid looks like



References
==========

- Raspberry Pi: http://raspberrypi.org
- Ruby on Raspberry Pi: http://rayhightower.com/blog/2012/12/03/ruby-on-raspberry-pi/
- Reading/writing GPIO pins on Raspberry Pi:  https://github.com/jwhitehorn/pi_piper
- Lights Out! game: http://mathworld.wolfram.com/LightsOutPuzzle.html

