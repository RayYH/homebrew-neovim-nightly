cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "475d8a6cf7abd0b435a3073a28fbbdcf5df94085b02945d4170e9bfe9a9d660d",
         intel: "bf60f800f1c2dcb50e233cae4acc32e949228e71d0b10194251340f03c3790a5"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end