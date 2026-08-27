
mandelbrot-f
==============

Mandelbrot in Fortran. 

### Other Language Implementations

This project compares the performance and features of Mandelbrot set generation in different languages.
Single Thread/Multi-thread shows the number of seconds it takes to do a 5000x5000 calculation.



| Language    | Repository                                                           | Single Thread   | Multi-Thread | Simd | Multi-Thread + Simd |
| :--------   | :------------------------------------------------------------------- | ---------------:| -----------: | ----:| ------------------: |
| Awk         | [mandelbrot-awk](https://github.com/jesper-olsen/mandelbrot-awk)     |           417.9 |              |      |                     |
| C           | [mandelbrot-c](https://github.com/jesper-olsen/mandelbrot-c)         |             3.6 |          0.6 |  0.7 |               0.2   |
| Erlang      | [mandelbrot_erl](https://github.com/jesper-olsen/mandelbrot_erl)     |            35.6 |          8.3 |      |                     |
| **Fortran** | [mandelbrot-f](https://github.com/jesper-olsen/mandelbrot-f)         |             4.5 |              |      |                     |
| Lua         | [mandelbrot-lua](https://github.com/jesper-olsen/mandelbrot-lua)     |            33.2 |              |      |                     |
| Mojo        | [mandelbrot-mojo](https://github.com/jesper-olsen/mandelbrot-mojo)   |             3.8 |          1.2 |  0.7 |               0.4   |
| Nushell     | [mandelbrot-nu](https://github.com/jesper-olsen/mandelbrot-nu)       |                 |              |      |                     |
| Odin        | [mandelbrot-odin](https://github.com/jesper-olsen/mandelbrot-odin)   |             4.4 |              |      |                     |
| Python      | [mandelbrot-py](https://github.com/jesper-olsen/mandelbrot-py)       |     (pure) 93.3 | (jax)    5.9 |      |                     |
| R           | [mandelbrot-R](https://github.com/jesper-olsen/mandelbrot-R)         |                 |              |      |                     |
| Rust        | [mandelbrot-rs](https://github.com/jesper-olsen/mandelbrot-rs)       |             4.7 |          1.3 |      |                     |
| Swift       | [mandelbrot-swift](https://github.com/jesper-olsen/mandelbrot-swift) |             4.5 |          1.2 |  1.3 |               0.7   |
| Tcl         | [mandelbrot-tcl](https://github.com/jesper-olsen/mandelbrot-tcl)     |           306.9 |              |      |                     |
| Zig         | [mandelbrot-zig](https://github.com/jesper-olsen/mandelbrot-zig)     |             4.9 |          0.9 |  0.7 |               0.3   |


## Prerequisites

You will need the following installed:

1.  The fortran compiler (brew install gfortran)
2.  The fortran package manager (brew install fpm)
3.  **Gnuplot** (required *only* for generating PNG images).


### Build
-----

    $ fpm build


### Options

---

Dimensions and view are configurable via `key=value` arguments:

```
width=<n>         Image width in pixels (default: 100)
height=<n>        Image height in pixels (default: 75)
ll_x=<x>          Lower-left real part (default: -1.2)
ll_y=<y>          Lower-left imaginary part (default: 0.20)
ur_x=<x>          Upper-right real part (default: -1.0)
ur_y=<y>          Upper-right imaginary part (default: 0.35)
max_iter=<n>      Maximum escape-time iterations (default: 255)
-a, --ascii       Generate ASCII art instead of gnuplot data
```

For example, to zoom in on a different area at a custom resolution:

```
$ fpm run --profile release -- width=1200 height=900 ll_x=-0.75 ll_y=0.1 ur_x=-0.74 ur_y=0.11 -a
```

### Example run - ascii output

```sh
time fpm run --profile release -- --ascii

Project is up to date
Mandelbrot 100 x 75



                                                                              .
                                                                              .
                                                                                    . .....
                                                                                  .       . . _
.
                        .
 .                      .                                                                     .M.
                       . .                                                                   ... .
    .MM.             .                  .                                                        ._.
     ..   .  .     _..
   .        ...    .
            .    ..   .    .                                                                    . a.
                  ....     .            .                                              ..  _    ..__
                  .... .  .  .       ....     .                .               ..     .  a__......_M
                   ..........        .. .   .                ..                  .    ....__._.M_WMM
              ..  ...MM2a__..  .     ..._ . .                                         .  W.2MMMMMMMM
                _aa_aMMMMMM.._ ._. ...__.                     . . .                      __aMMMMMMMM
           .  _   ..MMMMMMM...M_M_W_.M_M..    .                   a..._  .          _  ..W_MMMMMMMMM
                ...a_MMMMMMMMMMMMMMMaMMM_.  ...                    .._a_.__   .          _.MMMMMMMMM
   .        .   _..._WMMMMMMMMMMMMMMMMMa.......               _ _.a.._a..      ..       ..._MMMMMMMM
       . _    ...__aMMMMMMMMMMMMMMMMMMMMM__.__         .           .aMMMaMM. W.M2M_. W.  ...aMMMMMMM
         ..    .._2MMMMMMMMMMMMMMMMMMMMMMMMa..          .  .    .Ma_WMMMMM2.a..MMMM.._M.2M.a.._MMMMM
     . ._.....M..2MMMMMMMMMMMMMMMMMMMMMMMMMM...         .._aW2_  ..2MMMMMMM..MWMMMMMMMMMMMMMMMMMMMMM
   . ..   ..aaMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM_. .   .    .a.MMM..2M.a.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
.   .      .._aMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.      .2_M.._MMM_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
     .   .   ...aMMMMMMMMMMMMMMMMMMMMMMMMMMMM_   .aW.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
           .  ...MMMMMMMMMMMMMMMMMMMMMMMMMMM....M_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
            .a..WMMMMMMMMMMMMMMMMMMMMMMMMMWM.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
          . _ ._.._MMMMMMMMMMMMMMMMMMMMMMM_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
       .. .     2_.aMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                a_ .2MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
              _.    .a._._a_MM___MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                        ..._.aMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                      M_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
           _   M   _a..MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
0.04s user 0.10s system 65% cpu 0.216 total
```

### Example run - 5000x5000 mandelbrot, gnuplot data output

```sh
time fpm run --profile release -- width=5000 height=5000 >image.txt

Project is up to date
4.37s user 0.10s system 98% cpu 4.521 tota
```

```sh
gnuplot topng.gp
```

![PNG](https://raw.githubusercontent.com/jesper-olsen/mandelbrot-f/main/mandelbrot.png)




