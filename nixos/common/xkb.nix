{...}: {
  # This is the setup to colemakify all my qwerty keyboards running X.
  services.xserver = {
    xkb = {
      xkbVariant = ",colemak_dh";
      layout = "us,us";
      xkbOptions = "grp:rctrl_rshift_toggle,grp_led:caps,caps:backspace";
    };
  };
}
