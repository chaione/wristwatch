# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wristwatch/version"

Gem::Specification.new do |s|
  s.name        = "wristwatch"
  s.version     = Wristwatch::VERSION
  s.authors     = ["Scott Burton"]
  s.email       = ["scott@chaione.com"]
  s.homepage    = "http://github.com/chaione/wristwatch"
  s.summary     = %q{Easy cron dispatching}
  s.description = %q{Easy cron dispatching}

  s.rubyforge_project = "wristwatch"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "rails", ">= 3.0"
end
