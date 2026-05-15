cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "3f7009d0e8276e88758fed1fdff1dfb7942eeec5b8841a1bfaf48edcf4682e48",
         intel: "e8def182cdbadeb23ae9ec8dff7ebc9ea60aa912f68ffb483168524419f26c28"

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