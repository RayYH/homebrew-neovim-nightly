cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "c0d4b7a666c5d0c01f11a36080f631d8c8e572f8aae8087eb55ef2348e0b9a06",
         intel: "9626b4bde1c0020bb23d90bf884f25a4f58a27ffb730283832e3f490f1b0ab7f"

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