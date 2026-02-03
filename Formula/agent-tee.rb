class AgentTee < Formula
  desc "Run commands while teeing stdout+stderr to per-concern log files"
  homepage "https://github.com/calebcauthon/agent-tee"
  url "https://github.com/calebcauthon/agent-tee/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "bc8f9462f64f06fb91f1a036809f7cd71fcea9cb99b5b62d5646d4d4f9d930d9"
  license "MIT"

  def install
    bin.install "t"
  end

  test do
    system "#{bin}/t", "--version"
    (testpath/".agent-tee/logs").mkpath
    system "#{bin}/t", "@test", "echo", "hello"
    assert_match "hello", (testpath/".agent-tee/logs/test.log").read
  end
end
