cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "3a04418c1b1226c8bcabb049a2e960ca5710a884385a80285ff0de9513ced4f2",
         intel: "9c4448ccbd1be7d77bb2706ffb0c468d02d6bb4af97d9f34f5cfd5c95e33dac2"

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