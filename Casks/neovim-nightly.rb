cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "f000c1fe5bf568d8f2d0cf8fb3f12cd560e96d3f4c5490e369513275ea8efa6a",
         intel: "04f7bc6ce3edeeed5d4eb29b7a02a0cb6092824c26920deb8cde5a8cffada5be"

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