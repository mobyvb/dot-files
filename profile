# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# helm path
export HELM_HOME=$HOME/.helm

# add go path
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export GOPRIVATE=github.com/storj/dataflow

# storj stuff
export STORJ_POSTGRES_TEST=postgres://postgres@localhost/teststorj?sslmode=disable
#export STORJ_TEST_COCKROACH=cockroach://root@localhost:26257/teststorj?sslmode=disable
export STORJ_SIM_POSTGRES=$STORJ_POSTGRES_TEST
export STORJ_SIM_REDIS=127.0.0.1:6379

# set vim as editor
export VISUAL=vim
export EDITOR="$VISUAL"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

