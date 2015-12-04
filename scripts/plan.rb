#!/usr/bin/env ruby

dir = File.expand_path(File.dirname(__FILE__))
require "#{dir}/shared.rb"

cf = ConfigFile.new(ARGV.first)

# Colors
GREEN="\033[0;32m"
BLUE="\033[0;34m"
GREY="\033[1;30m"
CYAN="\033[0;36m"
RED="\033[0;31m"
YELLOW="\033[0;33m"
NO_COLOR="\033[0m"
BOLD="\033[1m"

puts <<-EOF

#{GREY}    Folder:\t\t#{CYAN}#{cf.upload_dir}#{NO_COLOR}

#{GREY}    Destinations:\t

EOF

puts "#{GREY}      origin\t\t#{CYAN}https://s3.amazonaws.com/#{cf.bucket_name}#{cf.bucket_path}#{NO_COLOR}"
cf.cdns.each_pair do |k, v|
  cdn = "%-10.10s" % k
  puts "#{GREY}      #{cdn}\t#{CYAN}#{v}#{cf.bucket_path}#{NO_COLOR}"
end
if `test -z "$(git status --porcelain)"` == ""
  puts "\n    #{RED}WARNING:\n\n      Working directory is not clean. Commit changes before proceeding to avoid future caching issues.#{NO_COLOR}\n\n"
end
puts "\n"

