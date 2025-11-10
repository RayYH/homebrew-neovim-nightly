cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "d3634d9ed1a2d8906a2eb23cf4575b0327220649626b5889e544a34df21cfcf0",
         intel: "a2e3de76bb17cabe69c3e7a20baf0e073a431bc96f6876c0863017279a06e4f1"

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