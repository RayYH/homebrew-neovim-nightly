cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "9c5bfa945d9d25bce35afc19b80cc2b6199d330d64e2ce1ada44ebcf85c1afa8",
         intel: "76d12aa5f0796078d364f3ec300e52f41b20cfd829f89a5aaed1f44a54ce7b97"

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