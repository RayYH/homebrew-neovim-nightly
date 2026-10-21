cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "e74b4f287b366275f5d6dd078293525d2747fe3cae8509833f630bd739d804b1",
         intel: "3f26d5afdb6652288ab6a2899c44522cfd230c746e9bacaa964c579c1037e4a8"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}"]
  end
end