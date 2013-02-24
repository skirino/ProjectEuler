#!/usr/bin/env ruby

require 'fileutils'

if ARGV.size != 2
  puts <<-HELP
Usage: #{$0} <problem number> <language (extension of program file)>
HELP
  exit
end

n_str, ext = ARGV

template_file = "./templates/main.#{ext}"
unless File.exist?(template_file)
  puts "No template file matches with #{ext}"
  exit
end

n = n_str.to_i
min = ((n-1) / 50) * 50 + 1
max = ((n-1) / 50 + 1) * 50
dir = "#{min}-#{max}/#{n}"
FileUtils.mkdir_p dir

dest_file = "#{dir}/main.#{ext}"
unless File.exist?(dest_file)
  FileUtils.cp template_file, dest_file
end
