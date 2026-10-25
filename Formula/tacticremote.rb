class Tacticremote < Formula
  desc "Control AI coding agents from your iPhone or iPad"
  homepage "https://tacticremote.com"
  version "1.12.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@tacticremote/server-darwin-arm64/-/server-darwin-arm64-1.12.0.tgz"
      sha256 "846b28888f17fbbfdb086f091590bda689c579531c7fd7155881c163d558e328"
    end
    on_intel do
      url "https://registry.npmjs.org/@tacticremote/server-darwin-x64/-/server-darwin-x64-1.12.0.tgz"
      sha256 "dd1feca705a65d6ff44234d286e3f42a30e0077c520ef4d5cacef64c94058873"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@tacticremote/server-linux-arm64/-/server-linux-arm64-1.12.0.tgz"
      sha256 "baf0dfaffd2c478181e45be24f78e719569753f4139232be663548d52a585be6"
    end
    on_intel do
      url "https://registry.npmjs.org/@tacticremote/server-linux-x64/-/server-linux-x64-1.12.0.tgz"
      sha256 "c38196d594dd345fb11cd4d84e33a053b75828fa5583fcb70cbb02a3c713757e"
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
    assert_match version.to_s, shell_output("#{bin}/tacticremote --version").strip
  end
end
