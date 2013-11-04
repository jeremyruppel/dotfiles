#!/usr/bin/env rake

LINKS = FileList[ File.expand_path( 'src/**/{*,.[a-z]*}' ) ]

desc 'Install symlinks to $HOME'
task :symlinks do
  ln_sf LINKS, Dir.home
end

task :install => :symlinks
