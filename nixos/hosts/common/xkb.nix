{...}: {
  # This is the setup to colemakify all my qwerty keyboards running X.
  services.xserver = {
    layout = "us,us";
    xkbVariant = ",colemak_dh";
    xkbOptions = "grp:rctrl_rshift_toggle,grp_led:caps,caps:backspace";
  };
}
