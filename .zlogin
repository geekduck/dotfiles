##################################################################
#
#  .zlogin file
#
#  Read in after the .zshrc file when you log in.
#  Not read in for subsequent shells.  For setting up
#  terminal and global environment characteristics.
#
##################################################################

# Global but interactive-use only variables
manpath=(
    {/usr/local,/usr,}/share/man(N-/) 
)
export MANPATH
#export LESS='-iscj5'
export JLESSCHARSET=japanese
#export BLOCKSIZE=k
