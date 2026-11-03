cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "517a4a8942eaad0253df05ecf660d4ac56c3aecf15e5fb2d1a9ee6e378862fdb",
         intel: "0c0a268a784c316c9d7ffe5ee0499e74568bdfcd444bf34ecfe89b8716baca07"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}"]
  end
end