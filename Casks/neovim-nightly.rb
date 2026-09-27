cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "80abc3abadc0e3f3b18bbe7f5600cbe6b80c68e4e0f27f30ed7338bd3add0834",
         intel: "10b0005088307ab1d800b40aeda5b0dac6e535d7e9498b6da62e62eae53ee285"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end