class Tacticremote < Formula
  desc "Control AI coding agents from your iPhone or iPad"
  homepage "https://tacticremote.com"
  version "1.11.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@tacticremote/server-darwin-arm64/-/server-darwin-arm64-1.11.0.tgz"
      sha256 "e1ba0be10af4332e55f382fa537441f29f11364cbdc09c9bd370fedb11fcd35d"
    end
    on_intel do
      url "https://registry.npmjs.org/@tacticremote/server-darwin-x64/-/server-darwin-x64-1.11.0.tgz"
      sha256 "e04f184f96a02d35a1f347a57d68d94db5c28ea6644667e5283273b95d48e205"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@tacticremote/server-linux-arm64/-/server-linux-arm64-1.11.0.tgz"
      sha256 "3603775b704bed10a03894bb29993851e18c848a9d0fd6fd8cbe4c3b8e7e6206"
    end
    on_intel do
      url "https://registry.npmjs.org/@tacticremote/server-linux-x64/-/server-linux-x64-1.11.0.tgz"
      sha256 "a81b9918a3be70d0667ef4d26b5aa4642d71e3fed5e90a42f70191a3a765462f"
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
