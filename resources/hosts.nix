{...}:{
    let 
        taproot_ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGu9cjlFdK4M2udGnFIQgRbFVhHAQxUJtKPM6tjHEAt6";
        perch_ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEWrqm6Axh22waSmP3Z6VuDP+0bf5iqKkSPJa+qM8/U7";
    in
    programs.ssh.knownHosts = {
        "taproot".publicKey = taproot_ssh_key;
        "perch".publicKey = perch_ssh_key;
    }
}