class Tacticremote < Formula
  desc "Control AI coding agents from your iPhone or iPad"
  homepage "https://tacticremote.com"
  version "1.14.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@tacticremote/server-darwin-arm64/-/server-darwin-arm64-1.14.0.tgz"
      sha256 "f539832a8d2353e132d2b147b699265c911ec8b7059befcc9dd981171ae5da30"
    end
    on_intel do
      url "https://registry.npmjs.org/@tacticremote/server-darwin-x64/-/server-darwin-x64-1.14.0.tgz"
      sha256 "b7380de6a40ba442825ed1cfa1db85c9de7124a50bf3dde8eaf62cb8862c7929"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@tacticremote/server-linux-arm64/-/server-linux-arm64-1.14.0.tgz"
      sha256 "4946d835ad74f74fa7c539544cf4538d80d71d0a13fa5246744f96760262d385"
    end
    on_intel do
      url "https://registry.npmjs.org/@tacticremote/server-linux-x64/-/server-linux-x64-1.14.0.tgz"
      sha256 "7f0fa4c9e8be240623e25c94fd592d45a7052752cf8dbd0d625ba0fd0d17bb64"
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
