cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "1de2d28b3ef18f4cff6da3887728c60c26f1a1b7f88c7efee11c969625a017eb",
         intel: "2faefda5e3a93a7530ae0ffc6a6cdf899bb1cf90e2018d4dc5258b0a7e80e2a0"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz",
      verified: "github.com/neovim"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end