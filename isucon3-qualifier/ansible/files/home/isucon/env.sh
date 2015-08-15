#!/bin/sh

HOME=/home/isucon
GOROOT=$HOME/local/go
GOPATH=$GOROOT/bin
NODEPATH=$HOME/local/node-v0.10/bin
PERLPATH=$HOME/local/perl-5.18/bin
RUBYPATH=$HOME/local/ruby-2.0/bin
PYTHONPATH=$HOME/local/python-3.3/bin
PATH=$PYTHONPATH:$RUBYPATH:$PERLPATH:$NODEPATH:$GOPATH:$PATH:$HOME/bin

export PATH GOPATH GOROOT
exec "$@"
