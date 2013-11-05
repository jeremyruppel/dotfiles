require 'formula'

class Alfred < Formula
  url      'http://cachefly.alfredapp.com/Alfred_2.1_218.zip'
  homepage 'http://www.alfredapp.com/'
  sha1     '97c0bb73990aa761fd61f2b2c77fdfa0272c0c03'
  keg_only 'Alfred.app is installed to /Applications'

  def install
    prefix.install Dir.pwd
  end
end