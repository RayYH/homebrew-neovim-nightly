cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "e66bf55075798bf1354ea833c08ac31002c9b4df4f0f8c5b8d40c62554137f1f",
         intel: "0d15a40c196bd787ed154e6c1d0dd9a7172a47e5a711017c6bf7a0ef5df4e2e1"

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