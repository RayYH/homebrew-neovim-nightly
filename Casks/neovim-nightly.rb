cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "416bf2b2e73a8e7ac2330e0764d44cfb5717e52b5b34b01f8ea94b6809613fa9",
         intel: "d3bc21e921b7a2ac60f031cbe7657158bef9a618f216c747d67ca7ff5876f13d"

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