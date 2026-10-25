cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "98216d3240fa3251c040cb89ea5296fea59a5f8f8ffd9254f735561a31991cf4",
         intel: "8e575faf450a2889f104146192d1960a480c7cd8024affa6959dd68f0e68776a"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}"]
  end
end