class FontSfMonoNerdFontMono < Formula
  desc "SF Mono patched with Nerd Font, single width"
  homepage ""
  url "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/FontPatcher.zip"
  sha256 "42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a"
  license ""

  depends_on "fontforge" => :build

  deny_network_access!

  def install
    # Assume fonts exist here.
    fonts_dir = "/System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/"
    cp_r fonts_dir, "."

    Dir.glob("Fonts/*").each do |f|
      system "fontforge",
             "-script",
             "font-patcher",
             "--makegroups", "4",
             "--boxdrawing",
             "--complete",
             "--single-width-glyphs",
             f
    end
    (pkgshare/"fonts").install Dir["*.otf"]
  end

  def caveats
    <<~EOS
      To use fonts, run:
        cp -rv #{pkgshare}/fonts/* ~/Library/Fonts/
    EOS
  end
end
