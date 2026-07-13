cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "b3b9fb07c71dc3ad893c2d77ddb194b47d2da7ec19df71dbf16d8fec694d34f6",
         intel: "75ff5d581142c3b9ecf9c7c6f126b8b8235fe94bb154a3a5a72736f07048eda1"

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