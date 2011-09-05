require 'spec_helper'

describe Rack::DetectRobots do
  let :midleware do
    Rack::DetectRobots.new(lambda { |env| [200, {}, ['Dummy App']] })
  end

  let :bot_env do
    {"HTTP_USER_AGENT" => "I'm tha famous googlebot and nothing else"}
  end
  let :no_bot_env do
    {"HTTP_USER_AGENT" => 'bla Mozilla'}
  end
  describe "with robot match" do
    before do
      midleware.call(bot_env)
    end
    it "should detect robot" do
      bot_env[:rack_detect_robots].should be_robot
    end
    it "should set robot_name" do
      bot_env[:rack_detect_robots].robot_name.should == "googlebot"
    end
  end
  describe "without a match" do
    before do
      midleware.call(no_bot_env)
    end
    it "should not detect robot" do
      no_bot_env[:rack_detect_robots].should_not be_robot
    end
    it "should not set robot_name" do
      no_bot_env[:rack_detect_robots].robot_name.should be_nil
    end
  end
end