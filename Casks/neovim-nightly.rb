cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "29584522db5fff518692f958fbc0222d6beaccb92879fe6c7c1dcc6c7b157499",
         intel: "858c0570f7fb4ac04e896c69a8fcb6d703126816b39edb0f36d4558b08eefa76"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end