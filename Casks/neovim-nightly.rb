cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "f2c7cc3d032ce30496fe5cd4dc6ed9c8efd1364a2dda9c13790ec2147c7bad7d",
         intel: "4e76a8691b30137f4156cadbbf1954057b2b4ff1a91455116ce180c50ec9d3ee"

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