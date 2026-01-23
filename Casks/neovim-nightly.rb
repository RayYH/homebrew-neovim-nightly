cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "63ea9389c6f363d0218bd86a7db90ae60e2262864f35f53450dec4cf53bec34e",
         intel: "772a988a69be14b9e5557efedc29ff675edf21c0989ec267a1369f39c78f8294"

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