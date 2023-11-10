# DO NOT IMPORT OR REFERENCE FROM NIX CODE
let
  charlot = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINOHiQ9dj1ZklRzAFvlSjA2SjdGPmX/u2OCdmkZ/21lk hello@sparrows.dev";

  users = [charlot];

  # Systems
  perch = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDgbp+G7tbEdl7ikfCy1RKBHNMg8waeAxHl/LrToWg8OIiItRn2LzM7oGf3Bg99WJPyvxG17JTynGLuhuQiyPYsGMlwaKx1w0yIJB0k6JVq6OSgPX8tW9Ck81bPEtbOB8AsAOJClqe6rGEHMZnkPjv8r0p4jEEAd8qRRTSkM+v9nv2ISRStgzxTqxuc/HtUy/+rmjKwaBs6YrF1MqtcZfxSTRe2uDWDCNORMDXqXvysPwwMtXv6y6byuxsDaxNhXBydSTsvAnhQCEQfGkLbrvHMv+yfh9EQTishX/MMfjOWhp03itUTARI2qOSz/HBiZG53oZjV8Zl6GiHJaNbtUKPzK7WExFyKyRuJUJy06CaFrscYMb8RIDUUT1v5VC6cuf1hilquprQMeWR5d25i57v926PIU3s5G5+BvPkPMdBXYLWNmtoyodLiLmJ4Gy0UY+G1WixktuqLqpQJaKsUKDNBF6DRHppi0hzvLvUSVxRbFuRpllx4jTwwwHJ4d+vo6wQGoK+6QN7FPB2pJHdtXi8Gk0JfA5/ixPsTj+AieQjQylJbCAfZLDjC3aLAxJd8J+GL6zJmWaNMvStiE3uFSUA1vVz2V6xPMWmCFFNFOAyd2ZVIGchHCHR6SrGa94opxjneXXtmtTqPvpJuBgGwHdhp7cMF9oD0Iyj0/bsyM7gEuw== root@perch";

  systems = [perch];
in {
  # for each desired secret, put an entry like so
  # "somefile.age".publicKeys = [charlot perch]
  # Then use the agenix cli to write that secret securely into a file.

  "st_key_pem.age".publicKeys = [perch];
  "st_cert_pem.age".publicKeys = [perch];
}