
mandelbrot-f
==============

Mandelbrot in Fortran. 

### Other Language Implementations

This project compares the performance and features of Mandelbrot set generation in different languages.
Single Thread/Multi-thread shows the number of seconds it takes to do a 5000x5000 calculation.



| Language    | Repository                                                           | Single Thread   | Multi-Thread | Simd | Multi-Thread + Simd |
| :--------   | :------------------------------------------------------------------- | ---------------:| -----------: | ----:| ------------------: |
| **Awk**     | [mandelbrot-awk](https://github.com/jesper-olsen/mandelbrot-awk)     |           417.9 |              |      |                     |
| C           | [mandelbrot-c](https://github.com/jesper-olsen/mandelbrot-c)         |             3.6 |          0.6 |  0.7 |               0.2   |
| Erlang      | [mandelbrot_erl](https://github.com/jesper-olsen/mandelbrot_erl)     |                 |              |      |                     |
| Fortran     | [mandelbrot-f](https://github.com/jesper-olsen/mandelbrot-f)         |             6.1 |              |      |                     |
| Lua         | [mandelbrot-lua](https://github.com/jesper-olsen/mandelbrot-lua)     |            33.2 |              |      |                     |
| Mojo        | [mandelbrot-mojo](https://github.com/jesper-olsen/mandelbrot-mojo)   |             3.8 |          1.2 |  0.7 |               0.4   |
| Nushell     | [mandelbrot-nu](https://github.com/jesper-olsen/mandelbrot-nu)       |                 |              |      |                     |
| Odin        | [mandelbrot-odin](https://github.com/jesper-olsen/mandelbrot-odin)   |             4.4 |              |      |                     |
| Python      | [mandelbrot-py](https://github.com/jesper-olsen/mandelbrot-py)       |                 |              |      |                     |
| R           | [mandelbrot-R](https://github.com/jesper-olsen/mandelbrot-R)         |                 |              |      |                     |
| Rust        | [mandelbrot-rs](https://github.com/jesper-olsen/mandelbrot-rs)       |             4.7 |          1.3 |      |                     |
| Swift       | [mandelbrot-swift](https://github.com/jesper-olsen/mandelbrot-swift) |             4.5 |          1.2 |  1.3 |               0.7   |
| Tcl         | [mandelbrot-tcl](https://github.com/jesper-olsen/mandelbrot-tcl)     |           306.9 |              |      |                     |
| Zig         | [mandelbrot-zig](https://github.com/jesper-olsen/mandelbrot-zig)     |             4.9 |          0.9 |  0.7 |               0.3   |


### Build
-----

    $ fpm build

### Run
---
    $ time fpm run --profile release -- --ascii

```
Mandelbrot 1000 x 750
                                                                   
                                                     .             
                                                    .              
                                                                   
                                                                   
                                                     .             
                                                       .   . .     
                                                               ..  
                                                               .   
  .                                                           .. . 
 ..                                                            .M. 
    ..        ...             .                             . . . .
   ._M.                                                           _
   ..   ..    .                                                    
         . . .                                                     
 .           _ .          .                          .         ..a.
             ._.  .                       .                 ...  ._
           .  a.. _..     .                           . ........Ma_
            ..._.._       ._..           .                . ._a_MMM
           ..._MMM._ ..   ._             .     .             .MMMMM
       . ._.._MMMMM..._......   .           ...   _        .__MMMMM
             .aMMMaMMMM2_MM.a  _             .._.        .._2MMMMMM
             ..aMMMMMMMMMMM....             ___2.._         ._MMMMM
         .....MMMMMMMMMMMMMM.._.             .M22._   Ma .  ._MMMMM
     ..    .MMMMMMMMMMMMMMMMMM2      .      ._MMMa.  ._a._M....2MMM
      __ ...MMMMMMMMMMMMMMMMM_..       ...  ._MMMM_.M.MM__MMMMMMMMM
     . ._.aMMMMMMMMMMMMMMMMMMMM.      .MM..2a_MMMMMMMMMMMMMMMMMMMMM
 _ ..   ._MMMMMMMMMMMMMMMMMMMMM_   ..M MMM.MMMMMMMMMMMMMMMMMMMMMMMM
.        _._MMMMMMMMMMMMMMMMMMa. . a_W..MMMMMMMMMMMMMMMMMMMMMMMMMMM
          .2MMMMMMMMMMMMMMMMMMM...aM_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
        ._.2WMMMMMMMMMMMMMMMMa..2MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
        ...WMMMMMMMMMMMMMMMMM.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
        .   .2MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
      .     .MW_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
              _a2_WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                .2...MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                .aMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
             _._MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM

real	0m0.287s
user	0m0.225s
sys	0m0.033s
```

```
Run
---
    $ fpm run --profile release >image.txt
    $ gnuplot topng.gp 

```

![PNG](https://raw.githubusercontent.com/jesper-olsen/mandelbrot-f/main/mandelbrot.png)




