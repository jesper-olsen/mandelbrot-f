
mandelbrot-f
==============

Mandelbrot in Fortran. Other languages: 

* [Rust](https://github.com/jesper-olsen/mandelbrot-rs) 
* [Erlang](https://github.com/jesper-olsen/mandelbrot_erl) 
* [Python](https://github.com/jesper-olsen/mandelbrot-py) 

Build
-----

    $ fpm build

Run
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
Run
---
    $ fpm run --profile release >image.txt
    $ gnuplot topng.gp 

```
![PNG](https://raw.githubusercontent.com/jesper-olsen/mandelbrot-f/master/mandelbrot.png) 




