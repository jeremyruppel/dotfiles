#!/usr/bin/env rake

file '/Applications/TextMate.app' do
  sh 'brew install formulae/text-mate.rb'
end

desc 'Install TextMate 2'
task :textmate => '/Applications/TextMate.app'

task :install => :textmate
