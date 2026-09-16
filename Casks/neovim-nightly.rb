cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "7fb0e2933321acf273033010d67d67916c9e41f9c0ac8b0c8eb2d2e78e8160e0",
         intel: "3b2004962fbe6eea0733c41ab21e3582eb474522213e4842b25598ede4cc5260"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end