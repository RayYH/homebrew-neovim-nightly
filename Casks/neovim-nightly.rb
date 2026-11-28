cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "bca1dafea910dd646c91c4e6eeefda8a77a5c3004e435678e59fc6720b600f99",
         intel: "e425bd2cefc18e556a34cd34daa184bbeb1a98434aec37299ec33b6c1ce24cfd"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}"]
  end
end