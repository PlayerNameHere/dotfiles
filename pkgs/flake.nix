{
  description = "Private Nix flakes";

  inputs = {
    sddm-sugar-candy = {
      url = "git+https://framagit.org/MarianArlt/sddm-sugar-candy";
      flake = false;
    };
    catppuccin-fish = {
      url = "github:catppuccin/fish";
      flake = false;
    };
    catppuccin-macchiato-dark-cursors = {
      url = "https://github.com/catppuccin/cursors/raw/main/cursors/Catppuccin-Macchiato-Dark-Cursors.zip";
      flake = false;
    };
    catppuccin-gtk-macchiato-mauve = {
      type = "file"; # Work around nix#7083
      url = "https://github.com/catppuccin/gtk/raw/main/Releases/Catppuccin-Macchiato-Mauve.zip";
      flake = false;
    };
    catppuccin-waybar = {
      url = "github:catppuccin/waybar";
      flake = false;
    };
    catppuccin-mako = {
      url = "github:catppuccin/mako";
      flake = false;
    };
    catppuccin-zathura = {
      url = "github:catppuccin/zathura";
      flake = false;
    };
    wlsunset = {
      url = "sourcehut:~kennylevinsen/wlsunset";
      flake = false;
    };
    mali = {
      url = "github:cadsondemak/Mali";
      flake = false;
    };
    catppuccin-nvim = {
      url = "github:catppuccin/nvim";
      flake = false;
    };
    feline-nvim = {
      url = "github:feline-nvim/feline.nvim";
      flake = false;
    };
    nvim-web-devicons = {
      url = "github:kyazdani42/nvim-web-devicons";
      flake = false;
    };
    which-key-nvim = {
      url = "github:folke/which-key.nvim";
      flake = false;
    };
    hydra-nvim = {
      url = "github:anuvyklack/hydra.nvim";
      flake = false;
    };
    gitsigns-nvim = {
      url = "github:lewis6991/gitsigns.nvim";
      flake = false;
    };
  };

  outputs = inputs @ {...}: {
    overlay = final: prev: {
      inherit inputs;
      pvtpkgs = {
        sddm-sugar-candy = final.callPackage ./sddm-sugar-candy {};
        catppuccin-fish = final.callPackage ./catppuccin-fish {};
        catppuccin-macchiato-dark-cursors = final.callPackage ./catppuccin-macchiato-dark-cursors {};
        catppuccin-gtk-macchiato-mauve = final.callPackage ./catppuccin-gtk-macchiato-mauve {};
        catppuccin-waybar = final.callPackage ./catppuccin-waybar {};
        catppuccin-mako = final.callPackage ./catppuccin-mako {};
        catppuccin-zathura = final.callPackage ./catppuccin-zathura {};
        wlsunset = final.callPackage ./wlsunset {};
        mali = final.callPackage ./mali {};
        vimPlugins = final.lib.recurseIntoAttrs (final.callPackage ./vim-plugins {});
      };
    };
  };
}
