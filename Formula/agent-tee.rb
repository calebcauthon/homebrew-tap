class AgentTee < Formula
  desc "Run commands while teeing stdout+stderr to per-concern log files"
  homepage "https://github.com/calebcauthon/agent-tee"
  url "https://github.com/calebcauthon/agent-tee/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cd07cde54e54242547fe72bad86e72426139439130a86dc836ab3aa9af898085"
  license "MIT"

  def install
    bin.install "t"
  end

  test do
    system "#{bin}/t", "--version"
    (testpath/".agent-tee/logs").mkpath
    system "#{bin}/t", "test", "echo", "hello"
    assert_match "hello", (testpath/".agent-tee/logs/test.log").read
  end
end
