===================
Sample Installation
===================

SBCL
----

::

  wget https://sourceforge.net/projects/sbcl/files/sbcl/1.3.0/sbcl-1.3.0-x86-64-linux-binary.tar.bz2
  tar xvf sbcl-1.3.0-x86-64-linux-binary.tar.bz2
  cd sbcl-1.3.0-x86-64-linux
  sudo INSTALL_ROOT=/usr/local sh install.sh  # req. make/gnumake

  echo "export SBCL_HOME=/usr/local/lib/sbcl"  >> .bashrc
  export SBCL_HOME=/usr/local/lib/sbcl
  sbcl --version


QuickLisp
---------

::

  wget https://beta.quicklisp.org/quicklisp.lisp
  wget https://beta.quicklisp.org/quicklisp.lisp.asc
  gpg --verify quicklisp.lisp.asc quicklisp.lisp

  sbcl --load quicklisp.lisp
  * (quicklisp-quickstart:install)
  * (ql:system-apropos :snark) ; test
  * (ql:add-to-init-file) ; optional
  * (quit)


FriCAS
------

::

  wget https://sourceforge.net/projects/fricas/files/fricas/1.3.0/fricas-1.3.0-full.tar.bz2
  tar xvf ../downloads/fricas-1.3.0-full.tar.bz2
  cd /fricas-1.3.0
  ./configure
  make
  sudo make install


Quickload example
-----------------

::

  git clone https://github.com/nilqed/webSPAD.git
  cd webSPAD/src/
  fricas
  )lisp (load "minserver")



  kfp@1093:~/devel/webSPAD/src$ fricas
  viewman not present, disabling graphics
  /bin/sh: 1: exec:
  /usr/local/lib/fricas/target/x86_64-unknown-linux/bin/hypertex: not found
  Checking for foreign routines
  AXIOM="/usr/local/lib/fricas/target/x86_64-unknown-linux"
  spad-lib="/usr/local/lib/fricas/target/x86_64-unknown-linux/lib/libspad.so"
  foreign routines found
  openServer result 0
                         FriCAS Computer Algebra System
                              Version: FriCAS 1.3.0
                    Timestamp: Sun Oct  9 03:35:04 CEST 2016
  -----------------------------------------------------------------------------
     Issue )copyright to view copyright notices.
     Issue )summary for a summary of useful system commands.
     Issue )quit to leave FriCAS and return to shell.
  -----------------------------------------------------------------------------


  (1) -> )lisp (load "minserver")
  To load "hunchentoot":
    Load 1 ASDF system:
      uiop
    Install 18 Quicklisp releases:
      alexandria babel bordeaux-threads cffi chunga cl+ssl
      cl-base64 cl-fad cl-ppcre flexi-streams hunchentoot md5
      rfc2388 trivial-backtrace trivial-features
      trivial-garbage trivial-gray-streams usocket
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/usocket/2016-04-21/usocket-0.6.4.1.tgz">
  ; 73.15KB
  ==================================================
  74,903 bytes in 0.00 seconds (0.00KB/sec)
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/trivial-backtrace/2016-05-31/trivial-backtrace-20160531-git.tgz
  ">
  ; 8.73KB
  ==================================================
  8,941 bytes in 0.00 seconds (8731.45KB/sec)
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/rfc2388/2013-07-20/rfc2388-20130720-git.tgz
  ">
  ; 12.20KB
  ==================================================
  12,494 bytes in 0.00 seconds (0.00KB/sec)
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/md5/2015-08-04/md5-20150804-git.tgz">
  ; 12.40KB
  ==================================================
  12,696 bytes in 0.00 seconds (0.00KB/sec)
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/cl-ppcre/2015-09-23/cl-ppcre-2.0.11.tgz">
  ; 156.08KB
  ==================================================
  159,829 bytes in 0.01 seconds (17342.56KB/sec)
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/cl-fad/2016-08-25/cl-fad-0.7.4.tgz">
  ; 24.13KB
  ==================================================
  24,705 bytes in 0.00 seconds (0.00KB/sec)
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/cl-base64/2015-09-23/cl-base64-20150923-git.tgz
  ">
  ; 8.39KB
  ==================================================
  8,589 bytes in 0.00 seconds (0.00KB/sec)
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/trivial-garbage/2015-01-13/trivial-garbage-20150113-git.tgz
  ">
  ; 9.82KB
  ==================================================
  10,053 bytes in 0.00 seconds (0.00KB/sec)
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/flexi-streams/2015-07-09/flexi-streams-1.0.15.tgz
  ">
  ; 168.10KB
  ==================================================
  172,138 bytes in 0.01 seconds (21012.94KB/sec)
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/trivial-features/2015-09-23/trivial-features-20150923-git.tgz
  ">
  ; 10.26KB
  ==================================================
  10,510 bytes in 0.00 seconds (0.00KB/sec)
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/babel/2015-06-08/babel-20150608-git.tgz">
  ; 248.03KB
  ==================================================
  253,987 bytes in 0.01 seconds (19079.55KB/sec) 
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/cffi/2016-03-18/cffi_0.17.1.tgz">
  ; 234.48KB
  ==================================================
  240,107 bytes in 0.01 seconds (18036.88KB/sec)
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/cl+ssl/2016-04-21/cl+ssl-20160421-git.tgz
  ">
  ; 31.67KB
  ==================================================
  32,429 bytes in 0.00 seconds (10556.32KB/sec)
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/trivial-gray-streams/2014-08-26/trivial-gray-streams-20140826-git.tgz
  ">
  ; 7.78KB
  ==================================================
  7,966 bytes in 0.00 seconds (0.00KB/sec)
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/chunga/2014-12-17/chunga-1.1.6.tgz">
  ; 20.43KB
  ==================================================
  20,919 bytes in 0.00 seconds (0.00KB/sec)
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/alexandria/2016-08-25/alexandria-20160825-git.tgz
  ">
  ; 49.63KB
  ==================================================
  50,819 bytes in 0.00 seconds (24813.96KB/sec)
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/bordeaux-threads/2016-03-18/bordeaux-threads-v0.8.5.tgz
  ">
  ; 19.63KB
  ==================================================
  20,105 bytes in 0.00 seconds (19633.79KB/sec)
  ; Fetching #<URL "
  http://beta.quicklisp.org/archive/hunchentoot/2016-03-18/hunchentoot-1.2.35.tgz
  ">
  ; 211.90KB
  ==================================================
  216,986 bytes in 0.01 seconds (23544.49KB/sec)
  ; Loading "hunchentoot"
  [package impl-specific-gray]......................
  [package trivial-gray-streams]....................
  [package chunga]..................................
  [package cl-base64]...............................
  [package alexandria.0.dev]........................
  [package bordeaux-threads]........................
  [package cl-fad]..................................
  [package path]....................................
  [package cl-ppcre]................................
  ..................................................
  [package flexi-streams]...........................
  ..................................................
  ..................................................
  ..................................................
  [package babel-encodings].........................
  [package babel]...................................
  ..................................................
  ..................................................
  [package cffi-sys]................................
  [package cffi]....................................
  ..................................................
  [package cffi-features]...........................
  [package trivial-garbage].........................
  [package cl+ssl]..................................
  [package md5].....................................
  [package rfc2388].................................
  [package trivial-backtrace].......................
  [package usocket].................................
  [package url-rewrite].............................
  [package hunchentoot].............................
  ........
  Value = T
  (1) ->


