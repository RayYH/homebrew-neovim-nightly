cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "194e93f2317f5b85ef047f9628ae5aeb0d44455acccce2dbd8f24ad4dff98ea1",
         intel: "7da0aacd41fac7bfb709de05b86140891a587d1ee4d97456beb4a0b5c9b4e342"

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