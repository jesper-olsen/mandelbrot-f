module mandelbrot_f
   implicit none
   private
   public :: say_hello
   public :: mandelbrot

   type :: config_t
      integer :: width = 100
      integer :: height = 75
      logical :: output_ascii = .false.
      real :: ll_x = -1.2
      real :: ll_y = 0.20
      real :: ur_x = -1.0
      real :: ur_y = 0.35
      integer :: max_iter = 255
   end type config_t

contains
   subroutine say_hello
      type(config_t) :: config
      integer, allocatable :: pixels(:, :)
      integer :: i
      character(len=128) :: arg

      do i = 1, command_argument_count()
         call get_command_argument(i, arg)
         call parse_arg(arg, config)
      end do

      allocate (pixels(config%width, config%height))
      call mandelbrot(config, pixels)

      if (config%output_ascii) then
         call display_ascii(config, pixels)
      else
         call display_int(config, pixels)
      end if
   end subroutine say_hello

   subroutine usage()
      print *, "Usage: mandelbrot [options]"
      print *, "Options (key=value):"
      print *, "  width=<n>         Image width in pixels (default: 100)"
      print *, "  height=<n>        Image height in pixels (default: 75)"
      print *, "  ll_x=<x>          Lower-left real part (default: -1.2)"
      print *, "  ll_y=<y>          Lower-left imaginary part (default: 0.20)"
      print *, "  ur_x=<x>          Upper-right real part (default: -1.0)"
      print *, "  ur_y=<y>          Upper-right imaginary part (default: 0.35)"
      print *, "  max_iter=<n>      Maximum escape-time iterations (default: 255)"
      print *, "  -a, --ascii       Generate ASCII art instead of gnuplot data"
      stop
   end subroutine usage

   !> Parses a single "key=value" command-line argument. "-a"/"--ascii" are
   !> also recognised (no "=") to select ASCII output mode.
   subroutine parse_arg(arg, config)
      character(len=*), intent(in) :: arg
      type(config_t), intent(inout) :: config
      integer :: eq_pos, ierr
      character(len=len(arg)) :: key, val

      select case (trim(arg))
      case ("-a", "--ascii")
         config%output_ascii = .true.
         return
      end select

      eq_pos = index(arg, "=")
      if (eq_pos <= 1) then
         print *, "Warning: Ignoring invalid argument '", trim(arg), "'"
         call usage()
      end if
      key = arg(1:eq_pos - 1)
      val = arg(eq_pos + 1:)

      select case (trim(key))
      case ("width")
         read (val, *, iostat=ierr) config%width
      case ("height")
         read (val, *, iostat=ierr) config%height
      case ("ll_x")
         read (val, *, iostat=ierr) config%ll_x
      case ("ll_y")
         read (val, *, iostat=ierr) config%ll_y
      case ("ur_x")
         read (val, *, iostat=ierr) config%ur_x
      case ("ur_y")
         read (val, *, iostat=ierr) config%ur_y
      case ("max_iter")
         read (val, *, iostat=ierr) config%max_iter
      case default
         print *, "Warning: Unknown parameter '", trim(key), "'"
         return
      end select

      if (ierr /= 0) then
         print *, "Warning: Invalid value for '", trim(key), "': '", trim(val), "'"
      end if
   end subroutine parse_arg

   !> Writes the image as whitespace-separated integers for gnuplot, one row
   !> per WRITE statement (rather than one per pixel) - the '(*(I0,1X))'
   !> format uses F2008's unlimited format repeat to print an entire row in
   !> a single call regardless of width. Rows are printed bottom-to-top to
   !> match gnuplot's "matrix with image" convention.
   subroutine display_int(config, pixels)
      type(config_t), intent(in) :: config
      integer, intent(in) :: pixels(:, :)
      integer :: y
      do y = config%height, 1, -1
         write (*, '(*(I0,1X))') pixels(:, y)
      end do
   end subroutine display_int

   subroutine display_ascii(config, pixels)
      type(config_t), intent(in) :: config
      integer, intent(in) :: pixels(:, :)
      integer :: stepx, stepy
      integer :: x, y
      write (*, '(A, I0, A, I0, A)') "Mandelbrot ", config%width, " x ", config%height
      stepx = max(1, config%width/50)
      stepy = max(1, config%height/50)
      do y = 1, config%height, stepx
         do x = 1, config%width, stepy
            write (*, '(A)', advance='no') cnt2char(pixels(x, y), config%max_iter)
         end do
         print *
      end do
   end subroutine display_ascii

   pure function cnt2char(N, max_iter) result(Char)
      integer, intent(in) :: N
      integer, intent(in) :: max_iter
      character(len=1) :: Char
      character(len=8), parameter :: symbols = "MW2a_. "
      integer :: Idx
      Idx = int(real(N)/real(max_iter)*(len(symbols) - 1)) + 1
      Char = symbols(Idx:Idx)
   end function cnt2char

   subroutine mandelbrot(config, pixels)
      type(config_t), intent(in) :: config
      integer, intent(out) :: pixels(:, :)
      real :: fwidth, fheight
      integer :: x, y
      complex :: c, ll, ur

      ll = cmplx(config%ll_x, config%ll_y)
      ur = cmplx(config%ur_x, config%ur_y)
      fwidth = real(ur) - real(ll)
      fheight = imag(ur) - imag(ll)

      do concurrent(y=1:config%height)
         do x = 1, config%width
            c = cmplx(real(ll) + x*fwidth/config%width, imag(ur) - y*fheight/config%height)
            pixels(x, y) = config%max_iter - escape_time(c, config%max_iter)
         end do
      end do
   end subroutine mandelbrot

   pure function escape_time(c, max_iter)
      complex, intent(in) :: c
      integer, intent(in) :: max_iter
      integer :: escape_time
      complex :: z
      z = c
      do escape_time = 0, max_iter - 1
         if (real(z)**2 + imag(z)**2 > 4.0) then
            exit
         end if
         z = z*z + c
      end do
   end function escape_time
end module mandelbrot_f
