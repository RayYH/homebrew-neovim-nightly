cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "f5c68ba25d4256c0c5749fc3e81cb5b6b0eae2ba49d98407c1dc4d137f8c2e93",
         intel: "1d1b9ce7e6cf41b39c476b2bc4a0ad68d9b2fb8e2f3df6b5e1e7dc7b2b1e6bfe"

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