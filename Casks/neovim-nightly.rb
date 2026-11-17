cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "053b52e701d1002c173392d829a2aa9bda6b0c65da22500cd44defec3f84cf63",
         intel: "9b45eec11bb6a80792c056c926f8cef6bf77b63bb3bfd692fb2c8ea217bcbe2c"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}"]
  end
end