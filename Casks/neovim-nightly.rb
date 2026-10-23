cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "e2b50ccc3e5a1640b5b8536b14519b347a8afdca5d835d9270915ca4b89352a7",
         intel: "90e2a703c5a6b7d11ef04203af2c5d1eb3e7542cfa19464e59204f57bf6473f2"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}"]
  end
end