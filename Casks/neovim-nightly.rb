cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "64b0bb48156f28a3ebf34cc1bc7fae1d3c0698a88baa62c9df620b1f630b4c7c",
         intel: "5477712a8cc2e96cb0683ce0549fc234c36bcd7ce7f5a88ad2946c1461006edc"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}"]
  end
end