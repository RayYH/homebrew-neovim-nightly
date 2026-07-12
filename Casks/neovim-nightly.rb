cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "cc77cadcd2cdc15966baa80a0689bf1a37c3aef48ca5671eb5e214a12a973f22",
         intel: "7e7ce74e95b3adbdb3313780d15faebc9301c6856863bdc4b6a86ee39e65f3ba"

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