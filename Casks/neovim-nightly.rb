cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "074222039d7f4d7793f0b7c5c5aee2c329b41035b1e919236240fb2edcbe4b08",
         intel: "2f4e54d099b452b72772e5fa6af0e032a5ad688e424797499cd31f7fc0179839"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end