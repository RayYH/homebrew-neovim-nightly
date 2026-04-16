cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "c97978f25e92e8ff931d71da0bde81c3bfea1c2805184ae5bf530228c7ccac0b",
         intel: "cbfffb61f12df0c498f0c2ede9ddf74ebc3632f243bf7f459a2028c3efd9c6fc"

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