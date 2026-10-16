cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "46725de4ff3ecf2c99d3ab75765f1a537aa130cc2e7efd1d7601eec1251d0530",
         intel: "ada9b6d3e443028a9b4ccbafe5e15555337c559c17b49402f7b88c61d3993f09"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}"]
  end
end