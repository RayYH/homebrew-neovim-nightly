cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "a19b6119f7e38f44424fe62cc023f504dbc0ce63d36e560dc9bc26358d55471c",
         intel: "98950a108c6c55954ea671c9c3982f4953b3e9ea314db93c4b565d54a1104c05"

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