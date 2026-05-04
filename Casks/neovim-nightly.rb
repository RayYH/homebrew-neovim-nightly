cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "63563d7ce7f77e0ba1d4353e7df4ccf0ac1fd6630ff72bbbba220baf2b0e6168",
         intel: "5e29cbc9aa0489a9b93b9a35c0c3fe0910f6208cb9a11c1517b037e0b6d3f528"

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