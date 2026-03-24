cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "66abeb2d01ed1d3f83d16cec554af24df1bfb5bbb3e9e51c6a4b54d4d208f470",
         intel: "943645caea05ec67b064aa44d39a46ea6b54571a0a1900c2d37d2ebcbb5b72c7"

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