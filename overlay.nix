{
 telescope-recent-files-src, noneckpain-src, neovim
}: prev: final: let
    plugins = import ./plugins.nix;
    runtimeDeps = import ./runtimeDeps.nix;
    secrets = import ./.secrets/secrets.nix;
    noneckpain = import ./packages/vimPlugins/noneckpain.nix { src = noneckpain-src; };
    telescope-recent-files = import ./packages/vimPlugins/telescopeRecentFiles.nix { src = telescope-recent-files-src; };
    ultisnipsSnippets = import ./packages/ultisnipsSnippets.nix { pkgs = prev; };
    luaConfigs = import ./packages/luaConfigs.nix { pkgs = prev; };
  in rec {
        # Collection of packages which will be available on PATH when running neovim
        neovimRuntimeDependencies = prev.symlinkJoin {
          name = "neovimRuntimeDependencies";
          paths = runtimeDeps.deps1 prev;
        };
        neovimRuntimeDependencies2 = prev.symlinkJoin {
          name = "neovimRuntimeDependencies2";
          paths = runtimeDeps.deps2 prev;
        };

        # Use wrapper from nixpkgs which will supply config file and plugins
        neovimPrimaMateria = prev.wrapNeovim neovim.packages.x86_64-linux.neovim {
          withNodeJs = true;
          configure = {
            customRC = import ./config { inherit ultisnipsSnippets luaConfigs; };
            packages.myVimPackage.start = plugins final ++ [
              # TODO: put both in the overlay and then just list them in plugins. Maybe it will work when we pass final as the pkgs.
              (telescope-recent-files prev)
              (noneckpain prev)
            ];
          };
        };

        # Another wrapper which just enhances PATH with runtime dependencies
        neovimPrimaMateriaWrapper = prev.writeShellApplication {
          name = "nvim";
          runtimeInputs = [ neovimRuntimeDependencies2 neovimRuntimeDependencies ];
          text = ''
            OPENAI_API_KEY=${secrets.openai-api-key} ${neovimPrimaMateria}/bin/nvim "$@"
          '';
        };
      }
