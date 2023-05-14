{ self, ... }:

let
  homeUsers = {
    shiba = {
      homeConfiguration = {
        imports = [
          self.homeManagerModules.planet
          (self.lib.importModule ./users/shiba { })
        ];
      };
    };
    samoyed = {
      homeConfiguration = {
        imports = [
          self.homeManagerModules.planet
          ./users/samoyed
        ];
      };
    };
  };
in
{
  # Make `homeUsers` available to other flake modules
  # In particular, make it available to the NixOS configuration
  _module.args = {
    inherit homeUsers;
  };
}
