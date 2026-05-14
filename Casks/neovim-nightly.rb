cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "0f0b137fd0bfd4394ca6e55d797f28421fa17752691f6cfc0bc447e9250c36ec",
         intel: "b78d18fe5c3af01e1ddde2fd56a4aaca906d02ebf4a7ca021b4d1924489c24de"

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