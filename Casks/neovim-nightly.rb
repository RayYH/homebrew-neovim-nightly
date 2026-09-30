cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "fa994f670b6464e545b5573e1ae2ef2054021bd3ebe893d907152d3d966daa2b",
         intel: "9ce430ce455a75f33de2e657a3f82c3a386e90f496ae3dd75745ec6e1b8ecaae"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end