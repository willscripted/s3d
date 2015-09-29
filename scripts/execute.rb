#!/usr/bin/env ruby

dir = File.expand_path(File.dirname(__FILE__))
require "#{dir}/shared.rb"

cf = ConfigFile.new(ARGV.first)

output = `aws s3 sync #{cf.build_dir} s3://#{cf.bucket}#{cf.deploy_path} --acl public-read #{cf.s3_sync_flags}`

puts output

