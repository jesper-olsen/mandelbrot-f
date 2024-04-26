module mandelbrot_f
   implicit none
   private

   public :: say_hello
   public :: mandelbrot

contains
   subroutine say_hello
      complex :: ll = (-1.2, 0.20)
      complex :: ur = (-1.0, 0.35)
      integer, parameter :: width = 1000
      integer, parameter :: height = 750
      !integer, parameter :: width = 5000
      !integer, parameter :: height = 5000
      integer :: pixels(width, height)

      logical :: output_ascii = .false.
      integer :: i, ierr
      character(len=128) :: output_str

      if (command_argument_count() > 2) then
          call usage()
      end if

      do i = 1, command_argument_count()
          call get_command_argument(i, output_str, ierr)
          select case (output_str)
              case ("-a", "--ascii")
                  output_ascii = .true.
              case default
                   call usage()
          end select
      end do

      call mandelbrot(ll, ur, pixels, width, height)
      if (output_ascii) then
          call display_ascii(pixels, width, height)
      else 
          call display_int(pixels,width,height)
      end if

   end subroutine say_hello

   subroutine usage()
          print *, "Usage: mandelbrot [options] "
          print *, "Options:"
          !print *, "  -w <width>        Set width (default: 800)"
          !print *, "  -h <height>       Set height (default: 600)"
          print *, "  -a, --ascii       Generate ASCII art"
          stop
   end subroutine usage

   subroutine display_int(pixels, width, height)
      integer, intent(in) :: pixels(:, :)   ! image
      integer, intent(in)  :: width        ! pixels
      integer, intent(in)  :: height       ! pixels
      integer :: x, y
      do y = height, 1, -1
         do x = 1, width
            write (*, '(I0, A)', advance='no') pixels(x, y), ' '
         end do
         print *
      end do
   end subroutine display_int

   subroutine display_ascii(pixels, width, height)
      integer, intent(in) :: pixels(:, :)   ! image
      integer, intent(in)  :: width        ! pixels
      integer, intent(in)  :: height       ! pixels
      integer :: stepx, stepy
      integer :: x, y
      write(*, '(A, I0, A, I0, A)') "Mandelbrot ", width, " x ", height
      stepx = max(1, width/50)
      stepy = max(1, height/50)
      do y = 1, height, stepx
         do x = 1, width, stepy
            write (*, '(A)', advance='no') cnt2char(pixels(x, y))
         end do
         print *
      end do
   end subroutine display_ascii

   pure function cnt2char(N) result(Char)
      integer, intent(in) :: N
      character(len=1) :: Char
      character(len=8), parameter :: symbols = "MW2a_. "
      integer :: Idx

      Idx = int(real(N)/255.0*(len(symbols) - 1)) + 1
      Char = symbols(Idx:Idx)
   end function cnt2char

   subroutine mandelbrot(ll, ur, pixels, width, height)
      integer, intent(out) :: pixels(:, :)  ! image
      integer, intent(in)  :: width        ! pixels
      integer, intent(in)  :: height       ! pixels
      complex, intent(in)  :: ll           ! lower left
      complex, intent(in)  :: ur           ! upper right

      real :: fwidth, fheight
      integer:: x, y
      complex :: c

      fwidth = real(ur) - real(ll)
      fheight = imag(ur) - imag(ll)
      do concurrent(y=1:height)
         !do y = 1, height
         do x = 1, width
            c = CMPLX(real(ll) + x*fwidth/width, imag(ur) - y*fheight/height)
            pixels(x, y) = 255 - escape_time(c)
         end do
      end do
   end subroutine mandelbrot

   pure function escape_time(c)
      complex, intent(in) :: c
      integer :: escape_time
      complex :: z
      z = c
      do escape_time = 0, 254
         if (real(z)**2 + imag(z)**2 > 4.0) then
            exit
         end if
         z = z*z + c
      end do
   end function escape_time

end module mandelbrot_f
