cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "4a567cf006f7f1d6bc766cc238ae5dc51925d62197fc4fb8e2701f8c39b20176",
         intel: "b2ce35e58df48d2174ab6cf33a2c302fbed2dbeff5aed23a09111f5bbe3f8e80"

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