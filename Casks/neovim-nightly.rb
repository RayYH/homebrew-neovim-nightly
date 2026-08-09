cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "b591bf85214692c596b0d2b7db54019b3f10bb0c5b6b4ee9c23c5b0c135f9f04",
         intel: "b1d2aa2f562349f18e0444f814c21e22f0ae363ba6aee2c76b461c5ba1cb9894"

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