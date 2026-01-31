cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "1edd0167d1ffb593f6cde8f02f69f44ec4b38d34b4b07e83a5ae29bd3c1ba1fc",
         intel: "5804c0f3b657220d53c60668282dd018ec4dad5e9d190816bcda4fcfe939aa22"

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