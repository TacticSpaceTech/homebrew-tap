class Tacticremote < Formula
  desc "Control AI coding agents from your iPhone or iPad"
  homepage "https://tacticremote.com"
  version "1.13.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@tacticremote/server-darwin-arm64/-/server-darwin-arm64-1.13.0.tgz"
      sha256 "bf9fe868f392109d098424407f6a3fc9c76374e53afd18980f8c432172d7950e"
    end
    on_intel do
      url "https://registry.npmjs.org/@tacticremote/server-darwin-x64/-/server-darwin-x64-1.13.0.tgz"
      sha256 "57e0e9314a60222ed0c489bb4c22acdd2fa0bb586ca1695d55604d078577f474"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@tacticremote/server-linux-arm64/-/server-linux-arm64-1.13.0.tgz"
      sha256 "b1211af5157ff8ec7b1cb485a61176fbc4930da50c96edfad42fb2fb7fb0f79a"
    end
    on_intel do
      url "https://registry.npmjs.org/@tacticremote/server-linux-x64/-/server-linux-x64-1.13.0.tgz"
      sha256 "361a239741155e3af2d3c671b4349ca89737125dcf494e6991adb05eb47ba9ae"
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
