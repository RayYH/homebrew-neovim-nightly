cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "2bb99b30fd7d6d86c6e2a2c445e55bf751ff8edeed2068be3206d30c70fbfb36",
         intel: "aeddc0fbd9b5095f4180f6bdc3b1d7e788be0a52aaa5e772800d1025e4a1e34d"

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