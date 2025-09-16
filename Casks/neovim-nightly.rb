cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "b40d4ef85e576b60b193ec3ae8ee6c3655afd1a8fa8236242acef020348e5cd2",
         intel: "bfdc2472cc0969115c5ba6bcd69b9df7cf73b4e7cf59c73e5c24db66d313325b"

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