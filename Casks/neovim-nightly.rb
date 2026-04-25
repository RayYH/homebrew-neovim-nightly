cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "366e840b0eecb0bd19af7fb15b055ab42a812504a88f3f69e38d012f4ed8fc3d",
         intel: "ea80d70a010a9bc5493ac9f81cc91f5c4e52c1493b2b704ebeb2344a5e5661c4"

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