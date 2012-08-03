if exists('g:loaded_operator_openbrowser')
  finish
endif


call operator#user#define('openbrowser', 'operator#openbrowser#do')

let g:loaded_operator_openbrowser = 1
