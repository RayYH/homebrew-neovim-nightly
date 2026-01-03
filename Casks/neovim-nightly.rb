cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "3c369eee4beba6a37ecf2081713a5e45a3c6b79d5a9090bac3dfe720e238ec1d",
         intel: "46bede725b2f5a1f348ae4623c2c2d69732d856e9d72c2b934d9a47d0dd0b6bb"

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