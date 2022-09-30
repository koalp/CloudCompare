{pkgs ? import <nixpkgs> {}}: let
  pythonEnv = pkgs.python39.withPackages (ps: [
    pkgs.python39.pkgs.pip
    pkgs.python39.pkgs.pybind11
    pkgs.cmake
  ]);
in
  pkgs.mkShell {
    packages = [
      pythonEnv
    ];
    nativeBuildInputs = with pkgs; [
      cmake
      eigen # header-only
      wrapGAppsHook
    ];
    buildInputs = with pkgs; [
      cmake
      boost
      cgal_5
      flann
      gdal
      gmp
      LASzip
      mpfr
      pdal
      pcl
      qt5.qtbase
      qt5.qtsvg
      qt5.qttools
      tbb
      xercesc
      python39.pkgs.pybind11
      python39.pkgs.pip
    ];
    QT_QPA_PLATFORM_PLUGIN_PATH = "${pkgs.qt5.qtbase.bin}/lib/qt-${pkgs.qt5.qtbase.version}/plugins";
  }
