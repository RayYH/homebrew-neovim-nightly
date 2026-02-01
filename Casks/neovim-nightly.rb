cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "5466e749dfa57a83a43f2fe031b6dd289649ca1ab47b5b5685bcbc78485cde84",
         intel: "9f15fe7a70363fbe0bb1baa32cb2c1920975b5c1156fcbe38d8ed2dbd9ada7f3"

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