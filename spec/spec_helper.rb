require 'bundler'
Bundler.setup
require 'rspec'
$:.unshift(File.join(File.expand_path(__FILE__), "..", "lib"))
require 'wristwatch.rb'

