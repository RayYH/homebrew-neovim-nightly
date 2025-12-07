cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "a7bc0b2f40c90acace74760e4bbc310169bee13cfb3eb2a8ef30b6524bd180ab",
         intel: "b7b3f0cbcf1b900258e9890ff915d28f28aa09eb821838207c00ad1644a5cff7"

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