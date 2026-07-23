cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "ef63148ab63380f66b512f76bce43d5398b29c0eaa2387d227e51bb7d4573aa8",
         intel: "e9fdec8e9ea80d7f8aa3bc326d9c38fdf45207cfce7f54445a4dfbdd16252a65"

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