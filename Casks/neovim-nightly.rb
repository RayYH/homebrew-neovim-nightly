cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "ea2c34f364c76d8b864d472b88d1bcddbb34e99d579e0bec3de0fab4f9017cbd",
         intel: "ad8f8465448e9db29b60ead15d9c2936b11a9d0e26ec10504793cb5cbe2a4f31"

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