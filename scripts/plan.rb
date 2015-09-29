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

#{GREY}    Folder:\t\t#{CYAN}#{cf.build_dir}#{NO_COLOR}

#{GREY}    Destinations:\t

EOF

cf.cdns.each_pair do |k, v|
  cdn = "%-10.10s" % k
  puts "#{GREY}      #{cdn}\t#{CYAN}#{v}#{cf.deploy_path}#{NO_COLOR}"
end
puts "\n"

