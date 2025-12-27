cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "0f0fd6e43d362e3babc3b960ea25e4951f8ee8f0e8cbffa53c903fb3b80aacc4",
         intel: "cc26de3bfe0972c52ad749d3116eac70ad0015d1c3ecaccbad124d9622da3a0b"

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