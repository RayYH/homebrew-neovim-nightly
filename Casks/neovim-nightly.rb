cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "89dad956be6bbb86c8d41f33721e9ec60e1cbf46187a7b8a9335d7b61f47cf52",
         intel: "80a98e3a467e14f92e9d0e96089c5e53824fe88d136186b158c8bbff1d4cec47"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}"]
  end
end