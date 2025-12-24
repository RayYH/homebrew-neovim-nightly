cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "665bcc6f7ccc159a12ab33b5ebb457a3051151fdb74fefd5b5c17c12413eb955",
         intel: "ec07e6c5f93898f3b2bd91066c8c2053422ff1360ad91f68c62e3cf8fde616fd"

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