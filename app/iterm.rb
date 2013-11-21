require 'formula'

class Iterm < Formula
  url      'http://www.iterm2.com/downloads/beta/iTerm2-1_0_0_20130811.zip'
  homepage 'http://www.iterm2.com/'
  sha1     '05ce2a91b937e1ad5736eeb5c0d6fec6d5b5aef5'
  keg_only 'iTerm.app is installed to /Applications'

  def install
    prefix.install Dir.pwd
  end
end
