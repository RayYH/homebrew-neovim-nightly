cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "7c8c0cda2a362602db4fc212e3dd0ee0d6ebcd1e414d8d716cfaf0f1fe2b0d57",
         intel: "edbb20f2d30a66b18f2b5cfc45747f3a3aaaaaf9a8fa48064db42f561f6bb742"

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