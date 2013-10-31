#!/usr/bin/env rake

namespace :symlinks do

  def files
    FileList[ '**/.?*.symlink' ].map do |repo|
      [ File.expand_path( repo ), File.expand_path( repo.pathmap( '~/%X' ) ) ]
    end
  end

  desc 'Install symlinks'
  task :install do
    files.each { |repo, home| ln_s repo, home }
  end

  desc 'Uninstall symlinks'
  task :uninstall do
    files.each { |repo, home| rm_f home }
  end
end
