cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "046fe2a7aadfee0b7574f82ca29566dfe1a0a19484d3b8a7321d3d36d5c0e48c",
         intel: "ee3a46bb28b04691fe12e716f72c45e0d22e15fef7300fef4ac6c60e745f6cbf"

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