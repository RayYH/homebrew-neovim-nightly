cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "d8c195f2369ce56ea88c9992650c574c2b83cdf81bf18d5dd4540d06b0e3b51d",
         intel: "9ba724b3b88c03c5dc5c2ab9c53427341885dee56ecb040c4bfbd023fd556ecb"

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