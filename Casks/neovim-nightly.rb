cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "6fd51acd2cd3d81ff2f4aedb3627c0a72dc36ad712b8cdcd702de569e6e36ec3",
         intel: "7357fd04b9ca73c3a708b3f7de22d969f44676732c55a37b689a0d0b694da00c"

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