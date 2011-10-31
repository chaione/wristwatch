require "core_ext/numeric"
require "wristwatch/version"
require "wristwatch/intervals"
require "wristwatch/schedule"
require "wristwatch/manifest"
require "wristwatch/task"
require "wristwatch/dispatch"

if defined?(Rails)
  require 'wristwatch/railtie'
end

module Wristwatch
  extend self

  def run
    Dispatch.new(Manifest.new.build, Schedule.new).execute
  end
end
