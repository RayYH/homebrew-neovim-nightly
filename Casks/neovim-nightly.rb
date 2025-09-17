cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "aacd9716bdc9f1b5a991fcca3c6b93873dd5f467442216c25bddbe27e6065256",
         intel: "2f04635ff2cf5369fdc10e35ee4a3f57cbbc61a4aa41a71ce92ea9a3092efa2e"

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