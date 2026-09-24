cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "5732b7860e9bcf8f6a2c04a3a7a8d7c9d1cad645f1d8621902b5ec14cbdb4a05",
         intel: "1049b2e8f49fe45ffef2e8bc3751c8c7a34c5d3207bdabc7cc32d10937c120d8"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end