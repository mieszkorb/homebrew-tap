class ZshSearchMultiWord < Formula
  desc "Zsh history search with multi-word queries and syntax highlighting"
  homepage "https://github.com/zdharma-continuum/history-search-multi-word"
  license any_of: ["MIT", "GPL-3.0-only"]
  head "https://github.com/zdharma-continuum/history-search-multi-word.git", branch: "main"

  deny_network_access!

  def install
    pkgshare.install "history-search-multi-word.plugin.zsh",
                     "history-search-multi-word",
                     "hsmw-context-main",
                     "hsmw-highlight"
  end

  def caveats
    <<~EOS
      To activate the plugin, add the following line to your ~/.zshrc:
        source #{HOMEBREW_PREFIX}/share/zsh-search-multi-word/history-search-multi-word.plugin.zsh
      The plugin binds Ctrl+R to start the multi-word history search.
    EOS
  end

  test do
    assert_path_exists pkgshare/"history-search-multi-word.plugin.zsh"
    assert_path_exists pkgshare/"hsmw-highlight"
  end
end
