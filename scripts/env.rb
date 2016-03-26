#!/usr/bin/env ruby

dir = File.expand_path(File.dirname(__FILE__))
require "#{dir}/shared.rb"

cf = ConfigFile.new(ARGV.first)

STDOUT.write(File.expand_path(File.join(`pwd`.strip, "#{cf.aws_keyfile}"))) if cf.aws_keyfile
