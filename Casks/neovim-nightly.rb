cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "4ab47df6c05875da7fe143afbc7cafb121742ab5de1ebebc04422f6f0c4cfffa",
         intel: "28e87a8bdab7fe5d53a679302fa5248e3a493f498a9e4b91f09abddff4e3bed4"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end