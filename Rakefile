#!/usr/bin/env rake

desc 'Install everything'
task :install

desc 'Generate man documentation'
task :docs do
  sh 'ronn man/**/*.md'
end
task :install => :docs
