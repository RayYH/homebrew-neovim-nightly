cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "1f0a8673ef6ffeae0091e5c281d37ea14cf4af8aff8ce5cf1b56f662852da41c",
         intel: "caa2f89b9de2584e927faec9357ed335fedac8f3d4a6ba5a68e82c3ed152c60b"

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