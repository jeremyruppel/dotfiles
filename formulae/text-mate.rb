require 'formula'

class TextMate < Formula
  url      'http://api.textmate.org/downloads/release', :using => :nounzip
  version  '2.0-alpha.9489'
  homepage 'http://macromates.com/'
  sha1     '117e5fedc3deadc26a3c6d4966b3968af5225937'
  keg_only 'TextMate is installed to your Applications folder'

  def install
    system 'tar', '-xf', downloader.tarball_path, '-C', '/Applications'
  end

  def caveats
    <<-EOS.undent
    Go to TextMate > Preferences > Terminal to install mate(1).
    EOS
  end
end
