cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "e0fdb598cbc405a1425e1e0adb9ce72d6411ff9b8493c82b161dcbe10d6bcdb3",
         intel: "0b5829a0d0147d27bf7e414d726b2bc971ce137f0d7b1b8da3cd4ad82cff8e95"

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