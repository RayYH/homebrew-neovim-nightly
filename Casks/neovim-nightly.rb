cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "a0d9ce1148d2b2bc5e6066afc06d1342fc519bfae7f36535c65005ed9bb705ee",
         intel: "d7eefd05ffc7aae3368fd5f2e6848c72250e1ac754a1ceac1060b780318215ac"

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