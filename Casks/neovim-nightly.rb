cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "0da3b13b38c642cf1ca0f92c819b18070aad11b1dc4f98eb8d4af231d53b8d33",
         intel: "6a0c78e75d6ee1d08c931e00132c8ec8b400f4f45ba1af705dc2a4eb55ab39e5"

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