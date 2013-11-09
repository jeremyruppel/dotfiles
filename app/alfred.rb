require 'formula'

class Alfred < Formula
  url      'http://cachefly.alfredapp.com/Alfred_2.1_218.zip'
  homepage 'http://www.alfredapp.com/'
  sha1     '97c0bb73990aa761fd61f2b2c77fdfa0272c0c03'
  keg_only 'Alfred.app is installed to /Applications'

  def install
    prefix.install Dir.pwd

    paths = [
    	'/Applications',
      '/Applications/Xcode.app/Contents/Applications',
      '/Developer/Applications',
      '/Library/PreferencePanes',
      '/System/Library/CoreServices/Applications',
      '/System/Library/PreferencePanes',
      '~/Library/Caches/Metadata',
      '~/Library/Mobile Documents',
      '~/Library/PreferencePanes',
      HOMEBREW_PREFIX/'Cellar/textmate',
      HOMEBREW_PREFIX/'Cellar/iterm'
    ]
    system 'defaults', 'write',
      'com.runningwithcrayons.Alfred-Preferences',
      'features.defaultresults.scope',
      '(%s)' % paths.map { |s| "'#{s}'" }.join( ', ' )
  end
end