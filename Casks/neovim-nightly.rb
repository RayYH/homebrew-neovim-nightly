cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "b6c004375ee1990d4ff9e4a6a19bd605ba0ede0246a1e0c5a929387bb988c531",
         intel: "35c29d608ffc8aea5f8f9fbf95329d80acfccf3a6c78ea4080f78f0ab057ad2c"

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