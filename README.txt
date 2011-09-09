== Rack Detect Robots ==

It's a simple Rack middleware to detect if the request is from one of the
known robots (Googl, Yahoo,)

== Usage (Rails 3) ==
Add it to your Gemfile:
gem "rack_detect_robots","0.0.1"

Ad it to your Rack stack:
use Rack::DetectRobots

In your application_controller.rb you can detect a robot with
env[:rack_detect_robots].robot?

and get it's matched name with
env[:rack_detect_robots].robot_name

That's it.

