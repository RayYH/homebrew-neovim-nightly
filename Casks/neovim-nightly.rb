cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "f06b5f5c3ad37d383f33f5fe12bb9c9ea61f5fcb2daac5fd0ea6e7f695287851",
         intel: "1ffa4975ed3a61840b97075868eb8fae71ba579a6b8bb4bb385ddf1d656e8339"

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