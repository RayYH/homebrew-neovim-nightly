cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "36d6fb9cf1df5cfefca483374c51cafc214fd027e07dac7a19c301b4b0e5f8c0",
         intel: "d1fa14b6ec6c0aaf1bda922dc741d68e48dc8dc89a88d515beacb581f8dd2cdf"

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