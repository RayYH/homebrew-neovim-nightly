cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "f091d3ff8627b6582c27fbb4ebfa0e7a6dea9c2485fcc2de989b856a0a3e3d6e",
         intel: "0abbabbfa16473a3e59326653f34ad47cf382e00d1bc4b9f1a9e9fe57d61cfa1"

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