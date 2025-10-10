cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "c8dc585f5d4a0d1c7d7f8eb3150d16b7cb3be263fcb169eca8a7514b4b352a2d",
         intel: "88ee43df499281f5a588b80c7c76a45dc6065d07fcee72f0f2a589ca83cf04ac"

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