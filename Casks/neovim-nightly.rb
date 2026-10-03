cask "neovim-nightly" do
  version :latest

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "dc9dd28221db76fb896757e4ddebe04ad7f5cc369ba74dad16b28975be495859",
         intel: "b00bcd5797fa0e569274d71d59d5fbb00ad7a6db1fb625cbb44a6655fd870552"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end