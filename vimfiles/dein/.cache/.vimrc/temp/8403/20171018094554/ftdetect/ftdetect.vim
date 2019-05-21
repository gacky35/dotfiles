" Vim ftdetect plugin file
" Language:           Windows PowerShell
" Maintainer:         Peter Provost <peter@provost.org>
" Version:            2.10
" Project Repository: https://github.com/PProvost/vim-ps1
" Vim Script Page:    http://www.vim.org/scripts/script.php?script_id=1327
"
au BufNewFile,BufRead   *.ps1   set ft=ps1
au BufNewFile,BufRead   *.psd1  set ft=ps1
au BufNewFile,BufRead   *.psm1  set ft=ps1
au BufNewFile,BufRead   *.pssc  set ft=ps1
" Vim ftdetect plugin file
" Language:           Windows PowerShell
" Maintainer:         Peter Provost <peter@provost.org>
" Version:            2.10
" Project Repository: https://github.com/PProvost/vim-ps1
" Vim Script Page:    http://www.vim.org/scripts/script.php?script_id=1327

au BufNewFile,BufRead   *.ps1xml   set ft=ps1xml
" Vim ftdetect plugin file
" Language:           Windows PowerShell
" Maintainer:         Peter Provost <peter@provost.org>
" Version:            2.10
" Project Repository: https://github.com/PProvost/vim-ps1
" Vim Script Page:    http://www.vim.org/scripts/script.php?script_id=1327

au BufNewFile,BufRead   *.cdxml    set ft=xml
au BufNewFile,BufRead   *.psc1     set ft=xml
" Vim filetype plugin
" Language:   Homebrew Formula
" Maintainer: Xu Cheng <xucheng@me.com>
" URL:        https://github.com/xu-cheng/brew.vim
" ----------------------------------------------------------------------------

function! s:isFormula()
  for i in range(1, line('$'))
    if !empty(matchstr(getline(i), 'class \S\+ *< *Formula'))
      return 1
    endif
  endfor
  return 0
endfunction

function! s:setFileType()
  set filetype=ruby
  if s:isFormula()
    set syntax=brew
  endif
endfunction

augroup filetypedetect
  au! BufNewFile,BufRead *.rb call s:setFileType()
augroup END

" vim: nowrap sw=2 sts=2 ts=8 noet:
au BufNewFile,BufRead *vimperatorrc*,*.vimp set filetype=vimperator
function! s:DetectJS()
    if getline(1) =~# '^#!.*/bin/\(env\s\+\)\?node\>'
        setfiletype javascript
    endif
endfunction
autocmd BufNewFile,BufRead * call s:DetectJS()
" Officially distributed filetypes

" Support functions {{{
function! s:setf(filetype) abort
  if &filetype !~# '\<'.a:filetype.'\>'
    let &filetype = a:filetype
  endif
endfunction

func! s:StarSetf(ft)
  if expand("<amatch>") !~ g:ft_ignore_pat
    exe 'setf ' . a:ft
  endif
endfunc
" }}}

" HTML with Ruby - eRuby
au BufNewFile,BufRead *.erb,*.rhtml				call s:setf('eruby')

" Interactive Ruby shell
au BufNewFile,BufRead .irbrc,irbrc				call s:setf('ruby')

" Ruby
au BufNewFile,BufRead *.rb,*.rbw,*.gemspec			call s:setf('ruby')

" Rackup
au BufNewFile,BufRead *.ru					call s:setf('ruby')

" Bundler
au BufNewFile,BufRead Gemfile					call s:setf('ruby')

" Ruby on Rails
au BufNewFile,BufRead *.builder,*.rxml,*.rjs,*.ruby		call s:setf('ruby')

" Rakefile
au BufNewFile,BufRead [rR]akefile,*.rake			call s:setf('ruby')
au BufNewFile,BufRead [rR]akefile*				call s:StarSetf('ruby')

" Rantfile
au BufNewFile,BufRead [rR]antfile,*.rant			call s:setf('ruby')

" vim: nowrap sw=2 sts=2 ts=8 noet fdm=marker:
" All other filetypes

" Support functions {{{
function! s:setf(filetype) abort
  if &filetype !=# a:filetype
    let &filetype = a:filetype
  endif
endfunction
" }}}

" Appraisal
au BufNewFile,BufRead Appraisals		call s:setf('ruby')

" Autotest
au BufNewFile,BufRead .autotest			call s:setf('ruby')

" Buildr Buildfile
au BufNewFile,BufRead [Bb]uildfile		call s:setf('ruby')

" Capistrano
au BufNewFile,BufRead Capfile,*.cap		call s:setf('ruby')

" Chef
au BufNewFile,BufRead Cheffile			call s:setf('ruby')
au BufNewFile,BufRead Berksfile			call s:setf('ruby')

" CocoaPods
au BufNewFile,BufRead Podfile,*.podspec		call s:setf('ruby')

" Guard
au BufNewFile,BufRead Guardfile,.Guardfile	call s:setf('ruby')

" Jbuilder
au BufNewFile,BufRead *.jbuilder		call s:setf('ruby')

" Kitchen Sink
au BufNewFile,BufRead KitchenSink		call s:setf('ruby')

" Opal
au BufNewFile,BufRead *.opal			call s:setf('ruby')

" Pry config
au BufNewFile,BufRead .pryrc			call s:setf('ruby')

" Puppet librarian
au BufNewFile,BufRead Puppetfile		call s:setf('ruby')

" Rabl
au BufNewFile,BufRead *.rabl			call s:setf('ruby')

" Routefile
au BufNewFile,BufRead [rR]outefile		call s:setf('ruby')

" SimpleCov
au BufNewFile,BufRead .simplecov		call s:setf('ruby')

" Thor
au BufNewFile,BufRead [tT]horfile,*.thor	call s:setf('ruby')

" Vagrant
au BufNewFile,BufRead [vV]agrantfile		call s:setf('ruby')

" vim: nowrap sw=2 sts=2 ts=8 noet fdm=marker:
" Copyright (c) 2013 Junegunn Choi
"
" MIT License
"
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
"
" The above copyright notice and this permission notice shall be
" included in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
" NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
" LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
" OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
" WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

au BufRead,BufNewFile *.vader set filetype=vader
" markdown filetype file
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx,tmp,old} set filetype=markdown
" Detect syntax file.
autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=neosnippet
