class Wtnow < Formula
  desc "Create a git worktree from any branch and cd into it"
  homepage "https://github.com/calebcauthon/wtnow"
  url "https://github.com/calebcauthon/wtnow/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "fd2f1dff2cfd4557dce95455729b73984d4a8440bfcd130586899285aa943d16"
  license "MIT"

  def install
    bin.install "wtnow"
  end

  def caveats
    <<~EOS
      wtnow changes your shell's current directory, so it needs a shell function
      wrapper. Add this to your ~/.zshrc (or ~/.bashrc, using `bash`):

        eval "$(wtnow init zsh)"

      Then restart your shell or run: source ~/.zshrc
    EOS
  end

  test do
    assert_match "wtnow", shell_output("#{bin}/wtnow --version")
    assert_match "wtnow()", shell_output("#{bin}/wtnow init zsh")
  end
end
