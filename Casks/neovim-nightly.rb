cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "a542076c86dcb7e5cd3a4fcd830453d3a3ae792e0488991c0bbcbb6c83c6ae09",
         intel: "9155e9407c1b40c3a0f05d86bcdc9ad07024a8db1164908fc511ef6fc0d8b91e"

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