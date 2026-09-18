cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "46079bd7f1a82f407080324be2e9855d8ef20b8df7023efcf314442ee36de57f",
         intel: "fd2b4b94ce0b694b2fa4fb7f3fb753a46bed80493133f49b3d9de4c7d747f970"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end