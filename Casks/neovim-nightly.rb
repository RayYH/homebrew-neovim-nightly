cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "7e47ed432e22d2e8ea17fe49c633f59c7ab92c165eca6fb2961624e768ef8e27",
         intel: "c9e7b20e5d87494c9d9277c5dd45a5f1a4d6090d8664ea6ba03f3896c74d8236"

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