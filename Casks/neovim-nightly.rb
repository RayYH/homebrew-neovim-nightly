cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "7981a6b7f98ac8c487d1163c8e9d8b82680acf635a55a53f0fbc68b8449b3a39",
         intel: "0c6c265a3e502f37d08f970e6fde4a65c4374e090ba2b953f2cbbd8240d2fab9"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end