cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "e0fbdca44156c0bf2e742d26472e549020ca91f4ba0ef969f52fd3a3e9c7d791",
         intel: "35c5aed32b16d3339feaf4744c8d8856c1f0adb1eb88ebe8864cc5350f44f0f2"

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