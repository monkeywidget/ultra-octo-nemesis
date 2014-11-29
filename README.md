ruby-octo-nemesis
=================

Turing-complete Lights-Out variant, logic running in ruby on Raspberry Pi.  Support for GPIO pins for lights/buttons.

How To
======

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


Run Tests
---------

Run rspec on your development system (not the pi)

    bundle exec rspec


Run on Pi
---------


Hardware requirements
---------------------

TBD: Details on what the button matrix / LED grid looks like

Development Notes
=================

- implement stubs to represent matrix hardware and specs


References
==========

- Raspberry Pi: http://raspberrypi.org
- Ruby on Raspberry Pi: http://rayhightower.com/blog/2012/12/03/ruby-on-raspberry-pi/
- Reading/writing GPIO pins on Raspberry Pi:  https://github.com/jwhitehorn/pi_piper
- Lights Out! game: http://mathworld.wolfram.com/LightsOutPuzzle.html
