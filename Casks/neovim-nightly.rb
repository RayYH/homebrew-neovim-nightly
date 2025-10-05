cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "70c8fd0ce67309b7e901df4f3e1f1087e752c40a4aca50dbf5fb1e7f5512af8b",
         intel: "ca5def4f1e4a02dc5ab5c91f99ecdecf85c43c0940ebb16a020395e6ff77564d"

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