" catium.vim - Add an Element of Nyan Cat to Vim
" Author:  ED
" Version: 1.0

scriptencoding utf-8

if exists('g:loaded_catium')
  finish
endif
let g:loaded_catium = 1

let s:traills = [
        \ ['='],
        \ ['/'],
        \ ['\'],
        \ ['\/'],
\ ]

let s:bodyls = [
        \ ['[]'],
        \ ['▩ '],
        \ ['□ '],
        \ ['[∴]'],
        \ ['[,_,]'],
\ ]

let s:facels = [
        \ ['*'],
        \ ['ه'],
        \ [':3'],
\ ]

let s:spacels = [
        \ ['-'],
        \ ['_'],
        \ ['∴ '],
        \ ['∵ '],
        \ ['∴∵'],
\ ]

function! g:Catium()
  let s:trailnum = get(g:, 'catium#trail', 0)
  let s:bodynum  = get(g:, 'catium#body', 0)
  let s:facenum  = get(g:, 'catium#face', 0)
  let s:spacenum = get(g:, 'catium#space', 0)
  if strlen(s:traills[s:trailnum][0]) == 1
    let s:trail = s:traills[s:trailnum][0].s:traills[s:trailnum][0]
  else
    let s:trail = s:traills[s:trailnum][0]
  endif
  if strlen(s:spacels[s:spacenum][0]) == 1
    let s:space = s:spacels[s:spacenum][0].s:spacels[s:spacenum][0]
  else
    let s:space = s:spacels[s:spacenum][0]
  endif
  let s:cat = s:bodyls[s:bodynum][0].s:facels[s:facenum][0]
  let s:totallen = winwidth(0) / 3 - strlen(s:cat)
  let s:traillen = line('.') * s:totallen / line('$') - 1
  let s:spacelen = s:totallen - s:traillen - 1
  return repeat(s:trail, s:traillen).s:cat.repeat(s:space, s:spacelen).' '
endfunction

