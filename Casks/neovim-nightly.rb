cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "4b4b12582b7740d8f4d8068687dec2f9b8ceb8eb69dba59f7c8da84fc63b82eb",
         intel: "17305e9100f9e7e9cb12c2172673dfdcea130d5f5c47f5871536f7dde88054a5"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}"]
  end
end