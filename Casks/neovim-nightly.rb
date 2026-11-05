cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "834a83646edd5f84446fe48257e64bf0fc71ead58db02567628ae5e2ebe49bc7",
         intel: "ba411f5a18ad09c52f8c0df0ad2ee0ff3cb8a6de0729c2fbab69c1228d45955f"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}"]
  end
end