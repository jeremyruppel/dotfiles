#!/usr/bin/env rake

BREW = `which brew`.chomp

file BREW do
  ruby '-e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"'
end

desc 'Install homebrew'
task :brew => BREW

task :install => :brew
