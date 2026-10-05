class ZshZephyr < Formula
  desc ":wind_face: A Zsh framework as nice as a cool summer breeze"
  homepage "https://github.com/mattmc3/zephyr"
  license "MIT"
  head "https://github.com/mattmc3/zephyr.git", branch: "main"

  deny_network_access!

  uses_from_macos "zsh"

  def install
    pkgshare.install Dir["*"]
  end

  # Use opt_pkgshare instead of pgkshare to avoid brew symlinks to zsh files
  def caveats
    <<~EOS
      To activate zephyr, add the following at the end of your .zshrc:

        source #{opt_pkgshare}/zephyr.zsh

      You will also need to restart your terminal for this change to take effect.
    EOS
  end

  test do
    assert_match "#{opt_pkgshare}",
      shell_output("zsh -c '. #{opt_pkgshare}/zephyr.zsh && echo $ZEPHYR_HOME'")
  end

end
