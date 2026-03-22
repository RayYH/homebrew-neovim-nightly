cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "51bb1dcb58b75f90ebb0d6aaedc43391c387b75698bd9fc550df8137e0a716d9",
         intel: "4eeab443a9ad9243c8cd7bc90a0c545a3d3e544406fa299f4ddb92d2250a4f19"

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