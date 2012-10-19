"=============================================================================
" FILE: autolaod/operator/openbrowser.vim
" AUTHOR: sgur <sgurrr+vim@gmail.com>
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================


function! operator#openbrowser#do(motion_wise)
  if !exists('g:loaded_openbrowser')
    echoerr 'operator-openbrowser:'
          \       'you must have installed openbrowser'
"        \       '(see :help operator-openbrowser-requirements)'
  endif
  if a:motion_wise == 'char'
    let start = col("'[")-1
    let end = col("']")-1
    let lines = getline(line("'["), line("']"))
    let lines[-1] = lines[-1][ : end]
    let lines[0] = lines[0][start : ]
  elseif a:motion_wise == 'line'
    let start = col("'[")-1
    let end = col("']")-1
    let lines = getline(line("'["), line("']"))
  else "  a:motion_wise == 'block'
    let start = col("'<")-1
    let end = col("'>")-1
    let lines = map(getline(line("'<"), line("'>")),
          \ 'v:val[start : end]'
          \ )
  endif
  call openbrowser#smart_search(join(lines))
endfunction
