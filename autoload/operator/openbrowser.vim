
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
          \ 'v:val[start, end]'
          \ )
  endif
  call openbrowser#smart_search(join(lines))
endfunction
