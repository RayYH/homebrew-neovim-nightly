cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "5f404f4c34c96a4f4c67e99b092147771cd97a47106f00ba48917faf72c5e2aa",
         intel: "0deedeb47975b7979704f0ef2565e2bcb3d4139bc8a2e144745a2e3fa6e2ef4a"

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