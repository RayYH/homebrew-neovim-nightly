cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "d5412760b35a0c0675e1e6c42a7e0c5df58fb7f8ca03c948c3d674b4b175ffed",
         intel: "8e618e50024a1553566053060de4dcfd8636c795efb8636e828423b8cf98293e"

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