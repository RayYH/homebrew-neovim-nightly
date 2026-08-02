cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "cf509a4cae3147e6f15d4f54f8116b5e66b67b87bb6982ab67afbcd6ea77cb36",
         intel: "4f60d7dc6f9e105254b85b8bc56a75488d17f2c070c4593d3e931543697c7b0d"

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