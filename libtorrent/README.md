# libtorrent

This plan packages [libtorrent-rasterbar](https://libtorrent.org/), built via its
CMake build (the autotools `./configure` build present in 1.2.x was removed upstream
in 2.0; the Boost.Build/Jamfile path still exists but CMake is what upstream
documents/recommends).

Python bindings are built (`-Dpython-bindings=ON`) since `rsertelon/deluge` imports
`libtorrent` directly. They link against Boost.Python, whose module name (e.g.
`python312`) is auto-detected from whichever `core/python` is on `PATH`, so it stays
in sync with `rsertelon/boost` as long as both are built against the same
`core/python`.

## Maintainers

* Romain Sertelon: <romain@sertelon.fr>

## Type of Package

Library package

## Usage

Add `rsertelon/libtorrent` to `pkg_deps` of anything that links against
`libtorrent-rasterbar` or imports the `libtorrent` Python module.
