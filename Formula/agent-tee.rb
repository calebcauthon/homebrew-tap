class AgentTee < Formula
  desc "Run commands while teeing stdout+stderr to per-concern log files"
  homepage "https://github.com/calebcauthon/agent-tee"
  url "https://github.com/calebcauthon/agent-tee/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "aa234176b8b10b5326aa29fc98c1f87f36625cb8cec321c0aa85097c05bdfdee"
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
