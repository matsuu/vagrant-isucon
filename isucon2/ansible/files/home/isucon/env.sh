#!/bin/sh

HOME=/home/isucon
NODEPATH=$HOME/local/node-v0.8/bin
PERLPATH=$HOME/local/perl-5.16/bin
RUBYPATH=$HOME/local/ruby-1.9/bin
PYTHONPATH=$HOME/local/python-2.7/bin
JAVAPATH=$HOME/local/java-6/bin
PATH=$JAVAPATH:$PYTHONPATH:$RUBYPATH:$PERLPATH:$NODEPATH:$PATH:$HOME/bin

export PATH
exec "$@"
