{ lib
, stdenv
}:

stdenv.mkDerivation rec {
  pname = "bats-require";
  version = "unreleased";

  src = ./.;

  dontBuild = true;

  # TODO: let a Makefile do this?
  installPhase = ''
    mkdir -p "$out/share/bats/bats-require"
    cp load.bash "$out/share/bats/bats-require"
  '';

  # makeFlags = [ "prefix=${placeholder "out"}" ];

  meta = with lib; {
    description = "Declarative assertion library for Bats";
    homepage = https://github.com/abathur/bats-require;
    license = licenses.mit;
    maintainers = with maintainers; [ abathur ];
    platforms = platforms.all;
  };
}
