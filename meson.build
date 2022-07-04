project('diskwrite', 'c')
compiler = meson.get_compiler('c')

has_stdio = compiler.has_header('stdio.h')
if not has_stdio
  error('stdio.h header not found.')
endif

has_string = compiler.has_header('string.h')
if not has_string
  error('string.h header not found.')
endif

has_malloc = compiler.has_header('malloc.h')
if not has_malloc
  error('malloc.h header not found')
endif

has_unistd = compiler.has_header('unistd.h')
if not has_unistd
  error('unistd.h header not found.')
endif

has_sys_stat = compiler.has_header('sys/stat.h')
if not has_sys_stat
  error('sys/stat.h header not found.')
endif

has_fcntl = compiler.has_header('fcntl.h')
if not has_fcntl
  error('fcntl.h header not found.')
endif

has_stdlib = compiler.has_header('stdlib.h')
if not has_stdlib
  error('stdlib.h header not found.')
endif

has_mman = compiler.has_header('sys/mman.h')
if not has_mman
  error('sys/mman.h header not found')
endif

has_wall = compiler.has_argument('-Wall')
if not has_wall
  error('This compiler does not support -Wall.')
endif

has_wextra = compiler.has_argument('-Wextra')
if not has_wextra
  error('This compiler does not support -Wextra.')
endif

add_global_arguments('-Wextra -Wall', language : 'c')

executable('diskwrite-cli', 'src/cli/main.c', 'src/cli/functions/getFileByteNum.c', install : true)