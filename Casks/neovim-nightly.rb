cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "a63b7a2f0a059e28efca93fdb2e9d46778bc3b5c0a4d384263ce4c2a66646c1c",
         intel: "5cb9b3290735c44e05961eab6d521eb82d5491ad26d7551d74f4bd0eb69df6df"

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