cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "c99041d425cd40cbd6a2baf70329890c5a9ca8a39e5f6a41b5084bf5d6c6e8eb",
         intel: "42f0bcfe49e58515c10f0bdfd2524ed8b760a0d41edfd3695322c12dcf5e3a6d"

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