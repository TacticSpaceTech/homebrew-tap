class Tacticremote < Formula
  desc "Control Claude Code from your iPhone/iPad - server component"
  homepage "https://tacticremote.com"
  version "1.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TacticSpaceTech/TacticRemote/releases/download/cli-v1.6.0/tacticremote-darwin-arm64.gz"
      sha256 "72188256e3dd074c37adcff3de9c651b97c4a71e6ce7ff009e08c28ce733a5bc"
    else
      url "https://github.com/TacticSpaceTech/TacticRemote/releases/download/cli-v1.6.0/tacticremote-darwin-x64.gz"
      sha256 "743d799c22a0dfd118d951d362db080bc0ada37421a674fe624f43ed0b13744e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/TacticSpaceTech/TacticRemote/releases/download/cli-v1.6.0/tacticremote-linux-arm64.gz"
      sha256 "3d68ddfa0fd5045088079c253f06e40218f5be3fd4190c7f6cdd0f8d8a750069"
    else
      url "https://github.com/TacticSpaceTech/TacticRemote/releases/download/cli-v1.6.0/tacticremote-linux-x64.gz"
      sha256 "4a3163a56e8665228a48a528985c4dd6c17371894018815f34edf52b5a932d49"
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
