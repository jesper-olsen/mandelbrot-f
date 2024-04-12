module mandelbrot_f
  implicit none
  private

  public :: say_hello
  public :: mandelbrot

contains
  subroutine say_hello
    complex :: ll = (-1.2,0.20)
    complex :: ur = (-1.0,0.35)
    integer, parameter :: width = 1000
    integer, parameter :: height = 750
    !integer, parameter :: width = 5000
    !integer, parameter :: height = 5000
    integer :: stepx
    integer :: stepy
    integer :: pixels(width, height)
    integer :: x, y
    character(len=1) :: ascii
    stepx = max(1,width / 50)
    stepy = max(1,height / 50)
    write(*, '(A, I0, A, I0, A)') "Mandelbrot ", width, " x ", height
    call mandelbrot(ll,ur,pixels,width,height)
    !print *, pixels
    !print ascii image
    do y = 1, height,stepx
        do x = 1, width,stepy
            write(*, '(A)', advance='no') cnt2char(pixels(x, y))
        end do
        print *   
    end do
  end subroutine say_hello

  pure function cnt2char(N) result(Char)
      integer, intent(in) :: N
      character(len=1) :: Char
      character(len=8), parameter :: symbols = "MW2a_. "
      integer :: Idx
 
      Idx = int(real(N) / 255.0 * (len(symbols) - 1)) + 1
      Char = symbols(Idx:Idx)
  end function cnt2char


  subroutine mandelbrot(ll, ur, pixels, width, height)
      integer, intent(out) :: pixels(:,:)  ! image
      integer, intent(in)  :: width        ! pixels
      integer, intent(in)  :: height       ! pixels
      complex, intent(in)  :: ll           ! lower left
      complex, intent(in)  :: ur           ! upper right 

      real :: fwidth, fheight
      integer:: x, y
      complex :: c

      fwidth = real(ur)-real(ll)
      fheight = imag(ur)-imag(ll)
      do concurrent (y = 1:height)
      !do y = 1, height
          do x = 1, width
              c = CMPLX(real(ll) + x*fwidth/width, imag(ur) - y*fheight/height)
              pixels(x,y) = 255 - escape_time(c)
          end do
      end do
  end subroutine mandelbrot

  pure function escape_time(c) 
    complex, intent (in) :: c 
    integer :: escape_time
    complex :: z
    z=c
    do escape_time=0,255
        if (real(z)**2+imag(z)**2>4.0) then
            exit
        end if
        z = z*z + c
    end do
  end function  escape_time

end module mandelbrot_f

