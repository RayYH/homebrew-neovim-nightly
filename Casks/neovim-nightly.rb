cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "8fa30e953d538670eb30ffdc03d503753354e9a4e4efe3e0d4e7fc2a14da4f58",
         intel: "d326267fa28b3207ec80da19ffd95a8ba3b45f6872ee7efba03a7c0b961d5d98"

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