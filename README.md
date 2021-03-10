# CurlAda

Ada 2012 bindings for the [libcurl C library](https://curl.se/).

## Status

At the moment this is just a proof of concept, and only the simplest usage of the [easy interface](https://curl.se/libcurl/c/libcurl-easy.html) works, as demonstrated in `tests/simple_test.adb`.

I simply [dumped an Ada spec of curl.h with GCC](https://learn.adacore.com/courses/intro-to-ada/chapters/interfacing_with_c.html#generating-bindings) and started tweaking and commenting out code until it compiled.

## Goals

- [X] Minimal but working PoC through the [easy API](https://curl.se/libcurl/c/libcurl-easy.html).
- [ ] Test a few of the typical CURLOPTs, see that they work.
- [ ] Polish the `CurlAda.Easy.Get_Info` function, make sure that all the information of a completed request can be retrieved.
- [ ] Hide the C interfacing into the package bodies so that users don't have to deal with `Interface.C` types directly.
- [ ] Organize the above tasks in [AUnit](https://github.com/1ma/libaunit-lab) tests that can be run automatically on a pipeline.
- [ ] Add suport for the [multi API](https://curl.se/libcurl/c/libcurl-multi.html) in a separate `CurlAda.Multi` package. Test it as well.
- [ ] Tag 1.0.0 and release as an [Alire crate](https://alire.ada.dev/crates.html).

## Acknowledgements

[Andreas Almroth](https://web.archive.org/web/20070403105909/www.almroth.com/adacurl/index.html) started a similar effort some 15 years ago.
His binding [is listed](https://curl.se/libcurl/bindings.html) on the bindings page of curl, but seems largely abandoned.
Some of the tweaks I had to do to the autogenerated spec to solve a handful of errors were guided by his implementation.


## Try out the PoC

You'll need a GNAT toolchain, gprbuild and curl's development files so that gcc can link the final executable with `-lcurl`.
On Ubuntu these are the `gnat gprbuild libcurl4-openssl-dev` packages.

```bash
$ git clone https://github.com/1ma/CurlAda
$ cd CurlAda
$ gprbuild tests/tests.gpr
$ ./bin/simple_test
```
