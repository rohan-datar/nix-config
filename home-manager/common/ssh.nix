{...}: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "uwgcloud" = {
        hostname = "34.66.110.218";
        identityFile = "~/.ssh/id_rsa";
      };

      "homemedia" = {
        hostname = "media.rdatar.com";
        user = "rdatar";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
