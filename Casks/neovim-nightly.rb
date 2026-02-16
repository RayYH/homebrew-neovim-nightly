cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "f86d884136be5a311463c5b4e7d29ca277e0abbc0a5e47f7a2ab0c4c583b62b1",
         intel: "a1cfbbcb269b71ad8e6eaf960c7da1ea84cb8f48c0134434fe3e87f18b358382"

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