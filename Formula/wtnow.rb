class Wtnow < Formula
  desc "Create a git worktree from the default branch and cd into it"
  homepage "https://github.com/calebcauthon/wtnow"
  url "https://github.com/calebcauthon/wtnow/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "eddc8f5496ae4aad234a10591fbde25159b4e1f8d2477c4ca225f9e5661c97b6"
  license "MIT"

  depends_on "git"

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
