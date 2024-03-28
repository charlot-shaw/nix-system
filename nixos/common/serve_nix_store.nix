{config,...}:{
    nix = {
        distributedBuilds = true;
        buildMachines = 
          let 
            sshUser = "sparrows";
            sshKey = "/home/sparrows/.ssh/id_ed25519";
            systems = [
                "x86_64-linux"
            ];
            supportedFeatures = [
                "benchmark"
                "big-parallel"
                "kvm"
            ];
          in [
            {
                inherit sshUser sshKey systems supportedFeatures;
                hostName = "bough";
                maxJobs = 4;
                speedFactor = 2;
            }
          ];

          settings = {
            builders-use-substitutes = true;
          };
    };

    programs.ssh.knownHosts = {
        bough = {
            hostNames = ["bough" "100.72.197.65"];
            publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMQk6nS9HvbuklDVX5ysR6Bt27L7WBHSkWCE1GJ3goTG root@bough";
        };
    };
}