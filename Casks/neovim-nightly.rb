cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "612b1c7ab6bbdb895b84db59e09487b228f372549337e9c2ecee7be7a8f90427",
         intel: "fea45fcb8617b70175294aa4673b7e939cb1ad4b2df67c96593ee47f6af132b8"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end