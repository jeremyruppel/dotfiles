require 'formula'

class Textmate < Formula
  url      'https://github.com/textmate/textmate/releases/download/v2.0-alpha.9489/TextMate_2.0-alpha.9489.tbz'
  version  '2.0-alpha.9489'
  homepage 'http://macromates.com/'
  sha1     '117e5fedc3deadc26a3c6d4966b3968af5225937'
  keg_only 'TextMate is installed to /Applications'

  def install
    prefix.install Dir.pwd
  end

  def test
    system 'mate -v'
  end

  def caveats
    <<-EOS.undent
    Go to TextMate > Preferences > Terminal to install mate(1).

    Run `brew linkapps` to link to /Applications
    EOS
  end
end
