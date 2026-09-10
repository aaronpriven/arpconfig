#!/usr/bin/env ruby
# encoding: UTF-8
# Utility for Mac OS X to locate files which have resource forks, and which
# therefore might be corrupted by being transferred via a non-Mac filesystem.
require 'find'
if ARGV.length != 1
puts "usage: forkboy <dir>"
puts "Reports files under the specified directory which have resource forks."
exit 0
end
Find.find(ARGV[0]) do |file|
rsrc = "#{file}/..namedfork/rsrc"
if File.exist?(rsrc) && File.lstat(rsrc).size > 0
puts file
end
end
