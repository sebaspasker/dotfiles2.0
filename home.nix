{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sebasp";
  home.homeDirectory = "/home/sebasp";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    nodejs_20
    kdePackages.kio # needed since 25.11
    kdePackages.kio-fuse # to mount remote filesystems via FUSE
    kdePackages.kio-extras # extra protocols support (sftp, fish and more)
    kdePackages.dolphin # file manager
    fastfetch
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/sebasp/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    SHELL = "/bin/fish";
    EDITOR = "vim";

  };

  # ---------- WALLUST -----------------

  programs.wallust = {
    enable = true;
    settings = {
      backend = "thumb";
      color_space = "lch";

      pallete = "saliencedarkbalanced";
      check_contrast = true;

      templates = {
        alacritty = {
          template = "colors-alacritty";
          target = "${config.xdg.configHome}/alacritty/colors.yml";
        };

        foot = {
          template = "colors-foot";
          target = "${config.xdg.configHome}/foot/foot-colors.ini";
        };
      };
    };
  };

  # ----------- BAT --------------------

  programs.bat = {
    enable = true;
  };

  # ----------  FUZZEL  ----------------
  programs.fuzzel = {
    enable = true;
  };

  # ---------- STARSHIP ----------------
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableInteractive = true;
  };

  # ----------  LF    -----------------
  programs.lf = {
    enable = true;
    extraConfig = builtins.readFile ./lf/lfrc;
  };

  # ---------- DUNST -----------------
  services.dunst = {
    enable = true;
    configFile = ./dunst/dunstrc;
  };

  # --------- ZATHURA  --------------

  programs.zathura = {
    enable = true;
    extraConfig = builtins.readFile ./zathura/zathurarc;
  };

  # ---------  FZF     --------------

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  # ---------- Ripgrep --------------

  programs.ripgrep = {
    enable = true;
  };

  # ----------- Foot ---------------

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=10";
        include = "${config.xdg.configHome}/foot/foot-colors.ini";
        # shell = "~/.nix-profile"

      };
    };
  };

  # ----------- Zoxide -------------

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  # --------- FISH ----------------

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
    '';
    shellInit = ''
       set -U fish_greeting ""
       fish_vi_key_bindings

       # PATH
       fish_add_path /home/sebasp/.local/bin/
       fish_add_path /nix/var/nix/profiles/default/bin
       fish_add_path $HOME/.nix-profile/bin
      fish_add_path $HOME/.nix-profile/bin
      fish_add_path $HOME/.npm-global/bin

       # Aliases
       alias pbpaste "xclip -selection clipboard -o"

       # Zoxide
       zoxide init fish | source

       # Keybindings
       source ~/.config/fish/keybind.fish
       set -gx STARSHIP_CONFIG $HOME/.config/starship.toml
    ''
    + builtins.readFile ./fish/config.fish;

    plugins = [
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "fzf";
        src = pkgs.fishPlugins.fzf.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }
    ];
  };

  # ---------- BTOP ----------------

  programs.btop = {
    enable = true;
  };

  # ---------  VIM     --------------
  programs.vim = {
    enable = true;
    extraConfig = builtins.readFile ./vim/.vimrc;
    plugins = with pkgs.vimPlugins; [
      auto-pairs
      coc-nvim
      fzf-vim
      git-messenger-vim
      nerdtree
      vim-sensible
      vim-surround
      ultisnips
      vim-css-color
      vim-commentary
      vim-flake8
      vim-highlightedyank
      vim-repeat
      vim-signify
      vim-slash
      vim-smoothie
      vim-nix
      vim-prettier
      rust-vim
      coc-rust-analyzer
      ale
      copilot-vim
      # Añadir psf/black
    ];
  };

  home.file.".vim/colors/mycolors.vim".source = ./vim/mycolors.vim;
  home.file.".vim/coc-settings.json".source = ./vim/coc-settings.json;
  home.file.".config/starship.toml".source = ./starship/starship.toml;
  xdg.configFile."fuzzel/fuzzel.ini".source = ./fuzzel/fuzzel.ini;
  xdg.configFile."fuzzel/colors.ini".source = ./fuzzel/colors.ini;
  # xdg.configFile."foot/foot-colors.ini".source = ./foot/foot-colors.ini;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "sebaspasker";
    userEmail = "sebaspasker@gmail.com";
  };
}
