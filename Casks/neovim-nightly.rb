cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "3d4056bff7f91410e39f8a6feb1780c89bb280a3074efe5a9909d540b14a7f75",
         intel: "f2031b97a5569e9b7bef48e9c4c159f7b91d4baba16ab2166084bb016689c1db"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end