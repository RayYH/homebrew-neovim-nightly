cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "ec0e7094d3a4c05fb51cd6277fa2ef362a44fa08d583d29af0ad04347eeddf7c",
         intel: "ccfc4318ef69fccb98940f8126dcb2f0a8271a4e02c7e0dd16419c38d4fd91b8"

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