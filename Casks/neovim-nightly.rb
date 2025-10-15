cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "0f4f16d7e79cf7b8a2bc861eef62a878a15a70629e2ecb39f1afbea6de4b8cba",
         intel: "611f330c8690294f75503ba9661a49774888393cec73183cbd3866e246d00f61"

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