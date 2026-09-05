# libxcrypt-compat

This plan packages [libxcrypt](https://github.com/besser82/libxcrypt), built with
`--enable-obsolete-api=glibc` so it produces `libcrypt.so.1` with the same symbol
versions as the `libcrypt.so.1` that glibc itself used to ship.

glibc removed its own `libcrypt` in 2.38, so anything still linked against the old
`libcrypt.so.1` (e.g. prebuilt binaries) fails to start with `libcrypt.so.1: cannot
open shared object file` unless something else provides it. This package is that
"something else" — comparable to Arch Linux's
[`libxcrypt-compat`](https://gitlab.archlinux.org/archlinux/packaging/packages/libxcrypt)
subpackage.

## Maintainers

* Romain Sertelon: <romain@sertelon.fr>

## Type of Package

Binary package

## Usage

Add `rsertelon/libxcrypt-compat` to `pkg_deps` of any plan whose binary needs
`libcrypt.so.1`. No further wiring is required — Habitat's `$LD_RUN_PATH`/rpath
handling picks up the dependency's `lib` directory automatically.
