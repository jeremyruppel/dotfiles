require 'formula'

class Adium < Formula
  url      'https://adiumx.cachefly.net/Adium_1.5.8.dmg'
  homepage 'https://www.adium.im/'
  # sha1     '97c0bb73990aa761fd61f2b2c77fdfa0272c0c03'
  keg_only 'Adium.app is installed to /Applications'

  def install
    prefix.install Dir.pwd
  end
end
