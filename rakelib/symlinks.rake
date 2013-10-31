#!/usr/bin/env rake

namespace :symlinks do

  LINKS = FileList[ File.expand_path( 'src/**/{*,.[a-z]*}' ) ]

  desc 'Install symlinks'
  task :install do
    ln_sf LINKS, Dir.home
  end
end
