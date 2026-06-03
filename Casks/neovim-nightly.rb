cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "bf6fc71d7c73ac6c169854678015b95b958a7d0f8a76a9a173c4ad24f6b0e3c8",
         intel: "ef3427302d5e57338016e09db273c31fe5c76aa3b3ef855ad6ceb89d0f6f376f"

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