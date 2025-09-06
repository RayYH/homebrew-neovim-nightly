cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "a4fd1bbe50402a0919881fd8ef9dc06099aaf154d2ea6f4ed9c1c4df35b33e6d",
         intel: "8c79b60dc8e1d332413f747ddb55efc649b1d13a2dca589c7122c11c43889f6f"

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