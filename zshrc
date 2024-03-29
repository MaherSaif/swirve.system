
if [ -x /usr/libexec/path_helper ]; then
      eval `/usr/libexec/path_helper -s`
fi

# http://aws.amazon.com/developertools/2928
export AWS_RDS_HOME=/usr/local/RDSCli-1.4.006
export AWS_CREDENTIAL_FILE=~/aws-credential-file
export JAVA_HOME=/Library/Java/Home

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:$PATH:/Library/PostgreSQL/9.0/bin:$AWS_RDS_HOME/bin
#     ~/bin                               \
#     ~/usr/bin                           \
#     /usr/local/bin                      \
#     /usr/bin                            \
#     /bin                                \
#     /usr/sbin                           \
#     /sbin                               \
#     /usr/local/sbin                     \
#     /usr/X11R6/bin                      \
#     /usr/X11/bin                        \
#     /usr/kerberos/bin                   \
#     /opt/local/bin                      \
#     $PATH
#   )

echo "path is now $PATH"
autoload colors
colors

DIRSTACKSIZE=20   # number of directories in your pushd/popd stack

#vi is better than emacs, and vim is even better
PREFERRED_EDITOR=vim
export EDITOR="$PREFERRED_EDITOR"
export VISUAL="$EDITOR" # I guess some programs use this instead of EDITOR
export PAGER=less

export LESS='-i' # case insensitive matching

#make grep colorful, always
alias grep='nocorrect grep --color=auto'

# make ls colorful
# osx uses G for colors (I guess)
#alias ls='ls --color=auto'
alias ls='ls -G'

# help me be lazy
alias l='ls'
alias ll='ls -alh'


# use vi on the commandline
bindkey -v
KEYTIMEOUT=1 #helps vi editing mode behave better

# general zsh options
setopt ALWAYS_TO_END      # when something is autocompleted, cursor to end of line
setopt AUTO_NAME_DIRS     # use named dirs when possible
setopt AUTO_PUSHD         # make cd work like pushd (useful for going back x directories with popd)
setopt NO_BEEP            # hate the beep
setopt AUTO_CD            # just type dir vs cd dir
setopt PUSHD_IGNORE_DUPS  # only put unique directories on the pushd stack
setopt RM_STAR_WAIT       # enforces a 10 second wait if you do a rm with a * in it


# history options
setopt EXTENDED_HISTORY        # saves beginning and ending timestamps to the history file
setopt HIST_EXPIRE_DUPS_FIRST  # assuming self-explanatory, but not sure
setopt HIST_VERIFY             # make history commands (subs the command into the line buffer before executing)
setopt INC_APPEND_HISTORY      # each zsh session appends to history file, allow parallel zsh to share one history, entries are appended immediately
HISTSIZE=20000
SAVEHIST=15000
HISTFILE=~/.history


# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _approximate _expand
# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# Don't prompt for a huge list, page it!
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# Don't prompt for a huge list, menu it!
zstyle ':completion:*:default' menu 'select=0'
# Have the newer files last so I see them first
zstyle ':completion:*' file-sort modification revers
# color code completion!!!!  Wohoo!
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"
# Separate man page sections.  Neat.
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/home/johnhin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PS1="%{${fg[red]}%}%B%n@%m] %b%{${fg[default]}%}"
RPROMPT="%{${fg[red]}%}%B%-%b%{${fg[default]}%}"

# "u 3" will resolve to cd ../../../
# very handy for deeply nested directories
u ()
{
  ud=".";
  for i ( `seq 1 ${1-1}` ) {
      ud="${ud}/..";
  }
  cd $ud;
}

# I always ls when entering a new directory
chpwd ()
{
  ls;
}

# simply creates a copy of the file with .bk affixed
bk ()
{
  `cp ${1-1} ${1-1}.bk`
}

# swap 2 files 
swap () 
{
  `mv $1 /tmp/$1.tempswapfile`
  `mv $2 $1`
  `mv /tmp/$1.tempswapfile $2`
}


# open firefox, not tied to current term
alias ff='nohup firefox&'


#################### coloring matters ########################
# Color codes: 00;{30,31,32,33,34,35,36,37} and 01;{30,31,32,33,34,35,36,37}
# are actually just color palette items (1-16 in gnome-terminal profile)
# your pallette might be very different from color names given at (http://man.he.net/man1/ls)
# The same LS_COLORS is used for auto-completion via zstyle setting (in this file)
#http://linux-sxs.org/housekeeping/lscolors.html
#
export LSCOLORS=exfxcxdxbxexexabagacad
#export LS_COLORS_BOLD='no=00:fi=00:di=;34:ln=01;95:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.tex=01;33:*.sxw=01;33:*.sxc=01;33:*.lyx=01;33:*.pdf=0;35:*.ps=00;36:*.asm=1;33:*.S=0;33:*.s=0;33:*.h=0;31:*.c=0;35:*.cxx=0;35:*.cc=0;35:*.C=0;35:*.o=1;30:*.am=1;33:*.py=0;34:'
#export LS_COLORS_NORM='no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:do=00;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.jpg=00;35:*.jpeg=00;35:*.gif=00;35:*.bmp=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.mpg=00;35:*.mpeg=00;35:*.avi=00;35:*.fli=00;35:*.gl=00;35:*.dl=00;35:*.xcf=00;35:*.xwd=00;35:*.ogg=00;35:*.mp3=00;35:*.wav=00;35:*.tex=00;33:*.sxw=00;33:*.sxc=00;33:*.lyx=00;33:*.pdf=0;35:*.ps=00;36:*.asm=0;33:*.S=0;33:*.s=0;33:*.h=0;31:*.c=0;35:*.cxx=0;35:*.cc=0;35:*.C=0;35:*.o=0;30:*.am=0;33:*.py=0;34:'
#export MY_LS_COLORS="${MY_LS_COLORS:-LS_COLORS_BOLD}"
#eval export LS_COLORS=\${$MY_LS_COLORS}


#rvm installation
#http://rvm.beginrescueend.com/
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm_project_rvmrc_default=1

#Fink installation 
#http://www.finkproject.org/download/srcdist.php 
source /sw/bin/init.sh 

export AUTOFEATURE=true 
export RSPEC=true

# anyone else want a better migrate?
# http://blog.voxdolo.me/twiki.html
twiki () {
  # say -v Zarvox 'beedee-beedee-beedee'
  rake db:migrate && rake db:migrate:redo && rake db:test:prepare
}

alias cucumber='cucumber --require features --require lib'

source ~/.zshrc.cmdprompt
