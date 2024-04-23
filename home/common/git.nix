{...}: {
  programs = {
    git = {
      enable = true;
      userEmail = "hello@sparrows.dev";
      userName = "Charlot Shaw";
      difftastic.enable = true;

      ignores = [
        ".nrepl-port"
        ".clj-kondo/"
        ".calva/"
        ".lsp/"
        ".cpcache/"
        ".direnv/"
      ];

      extraConfig = {
        rerere.enable = true;
        diff.algorithm = "patience";
        pull.rebase = true;

        init.defaultBranch = "main";

        commit.gpgsign = true;
        user.signingKey = "~/.ssh/id_ed25519.pub";
        gpg = {
          format = "ssh";
          ssh.allowedSignersFile = "~/.ssh/allowed_signers";
        };
      };
    };

    git-cliff = {
      enable = true;
    };
  };
}
