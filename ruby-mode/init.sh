export SITE_LISP=~/.emacs.d/site-lisp
mkdir -p $SITE_LISP
svn export http://svn.ruby-lang.org/repos/ruby/trunk/misc $SITE_LISP/ruby
/usr/bin/env emacs -batch -f batch-byte-compile $SITE_LISP/ruby
