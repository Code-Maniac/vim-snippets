
fun! vim_snippets#Sub(...)
  let template = get(a:000, 0, "$1")
  let arg2 = get(a:000, 1, "")
  let sub = get(a:000, 2, "")

  return substitute(template, '$1', sub, 'g')
endfun


" this is well known Filename found in snipmate (and the other engines), but
" rewritten and documented :)
"
" optional arg1: string in which to replace '$1' by filename with extension
"   and path dropped. Defaults to $1
" optional arg2: return this value if buffer has no filename
"  But why not use the template in this case, too?
"  Doesn't make sense to me
fun! vim_snippets#Filename(...)
  let template = get(a:000, 0, "$1")
  let arg2 = get(a:000, 1, "")
  let basename = expand('%:t:r')

  return vim_snippets#Sub(template, arg2, basename)
endf

" get the extension of the current file.
fun! vim_snippets#Extension(...)
  let template = get(a:000, 0, "$1")
  let arg2 = get(a:000, 1, "")

  let extension = '.' . expand('%:e')

  return vim_snippets#Sub(template, arg2, extension)
endfunc

" get the filename of the current file.
fun! vim_snippets#FilenameExt(...)
  let template = get(a:000, 0, "$1")
  let arg2 = get(a:000, 1, "")

  let name = expand('%:t')

  return vim_snippets#Sub(template, arg2, name)
endf

" DATE AND TIME FUNCTIONS
fun! vim_snippets#Datetime(...)
  let template = get(a:000, 0, "$1")
  let arg2 = get(a:000, 1, "")
  let format = get(a:000, 2, "%c")

  let datetime = strftime(format)

  return vim_snippets#Sub(template, arg2, datetime)
endf

fun! vim_snippets#DateUK(...)
  let template = get(a:000, 0, "$1")
  let arg2 = get(a:000, 1, "")
  let format = "%d/%m/%y"

  return vim_snippets#Datetime(template, arg2, format)
endfun

fun! vim_snippets#DateUS(...)
  let template = get(a:000, 0, "$1")
  let arg2 = get(a:000, 1, "")
  let format = "%m/%d/%y"

  return vim_snippets#Datetime(template, arg2, format)
endfun

fun! vim_snippets#Time(...)
  let template = get(a:000, 0, "$1")
  let arg2 = get(a:000, 1, "")
  let format = "%H:%M:%S"

  return vim_snippets#Datetime(template, arg2, format)
endfun
