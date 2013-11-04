#!/usr/bin/env rake

desc 'Install OSX Applications'
task :applications => :brew do
  FileList[ 'formulae/*.rb' ].each do |formula|
    sh 'brew', 'install', formula
  end
  sh 'brew', 'linkapps'
end
task :install => :applications
