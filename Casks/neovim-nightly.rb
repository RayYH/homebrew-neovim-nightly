cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "642bdce3c533f6117f94fbf4877fd3b17f05c771e157dff152114e8cb4995563",
         intel: "f43e93b0e4f71a06979dc3b7d441afb47843dbbf4aa5d44cac436ae8f0c78f28"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end