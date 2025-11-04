cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "a2f9bbf1339b6d7350e8251ea7b1bb9d577e31008f5e7982c8a8347c97b557ec",
         intel: "3e4dec7067b639d8181dbd4ec65b455fd6261d1eb0e29c6a66b128633e1a93d6"

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