cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "5e0e99a757c43cba62d21c033852c6331c8d86ee6b16268e7cbcef935c325d0b",
         intel: "f1a5a7d45e0b5bef74bd9ec296aa8642a89ea250c8653bd55f44533ab4be1f65"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}"]
  end
end