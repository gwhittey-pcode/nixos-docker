{ pkgs, ... }:
{
    programs.git = {
        extraConfig.credential.helper = "manager";
        extraConfig.credential."https://github.com".username = "gwhittey-pcode";
        extraConfig.credential.credentialStore = "cache";
        extraConfig.init.defaultBranch = "main";
        enable = true;
        userName  = "Gerard Whittey";
        userEmail = "gerard.whittey@gmail.com";
    };
} 