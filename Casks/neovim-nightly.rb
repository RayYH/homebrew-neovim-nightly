cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "69964cbc81d208d28919fb3a6a2dc5f3e6fa5380f7bc7967d73e270ae5a22d83",
         intel: "e8d874e800d1c3cc2c5523bf84e5d7d997eb2f68edbdfe252266d525c1f3dfea"

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