cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "9d5f3fc10e411fac811f1716a8f11ccf21d7d0cdb657a14ebf78d48e9c61c3ae",
         intel: "6393907adcebe41309e6dbf71f8cc157098712d160338e729e46ca337a4c533a"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end