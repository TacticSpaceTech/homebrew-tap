class Tacticremote < Formula
  desc "Control Claude Code from your iPhone/iPad - server component"
  homepage "https://tacticremote.com"
  version "1.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TacticSpaceTech/TacticRemote/releases/download/cli-v1.6.1/tacticremote-darwin-arm64.gz"
      sha256 "f069c16494dff587fc2a7a960c69e7f3f5fcbb55d499b7c1f671c5d0f0ec5dd8"
    else
      url "https://github.com/TacticSpaceTech/TacticRemote/releases/download/cli-v1.6.1/tacticremote-darwin-x64.gz"
      sha256 "5dd72dc2ea4553b34457184d473ba1629e9d2346ad579c3c49427eca37cf1698"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/TacticSpaceTech/TacticRemote/releases/download/cli-v1.6.1/tacticremote-linux-arm64.gz"
      sha256 "9d2905aad0426353102500d8dcc2e626ec0e504b7edc0f1fd9d958a2b0e2bad8"
    else
      url "https://github.com/TacticSpaceTech/TacticRemote/releases/download/cli-v1.6.1/tacticremote-linux-x64.gz"
      sha256 "3ba00eec482fca61a24dc5069908e59c59ac6549cf008b9af75224b1f4547c94"
    end
  end

  depends_on "tmux"

  def install
    binary_name = "tacticremote-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "x64"}"
    bin.install binary_name => "tacticremote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tacticremote --version").strip
  end
end
