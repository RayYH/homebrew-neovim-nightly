cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "d47c775a783731df0dbdf0efbb738a5fedfff9647de1273b91451f3f90d519de",
         intel: "23e4660e356f588165b9faa4013aeb4ff4f9512ec9af24d6c628c89d5dfda751"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}"]
  end
end