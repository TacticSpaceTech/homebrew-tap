class Tacticremote < Formula
  desc "Control AI coding agents from your iPhone or iPad"
  homepage "https://tacticremote.com"
  version "1.15.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@tacticremote/server-darwin-arm64/-/server-darwin-arm64-1.15.0.tgz"
      sha256 "0fc8685204de27b74f01d46b698ce81d9eabbb3465dfb9147af4f84afe5fcd38"
    end
    on_intel do
      url "https://registry.npmjs.org/@tacticremote/server-darwin-x64/-/server-darwin-x64-1.15.0.tgz"
      sha256 "450e7e833b7d233233ca52dc8d19c9a9258d9611fae27942108aebb7cd5f412f"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@tacticremote/server-linux-arm64/-/server-linux-arm64-1.15.0.tgz"
      sha256 "3ac921293a64561301fb597e63d2cec41aac012ce5f715751843a2f3cd398a4d"
    end
    on_intel do
      url "https://registry.npmjs.org/@tacticremote/server-linux-x64/-/server-linux-x64-1.15.0.tgz"
      sha256 "183fb6a37918fbeb039e3042a9857193b3a2935de244c9894968ddeabb96197d"
    end
  end

  depends_on "tmux"

  def install
    bin.install "bin/tacticremote-server" => "tacticremote"
    prefix.install "LICENSE"
  end

  def caveats
    <<~EOS
      Install a supported agent CLI and complete its sign-in on this computer.
      Run tacticremote, then follow the pairing prompts in the iPhone or iPad app.
      Tactic Remote is proprietary software; see the installed LICENSE.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("\"#{bin}/tacticremote\" --version").strip
  end
end
