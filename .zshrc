#########################
### Set/unset ZSH options
#########################
# setopt NOHUP
# setopt NOTIFY
# setopt NO_FLOW_CONTROL
# setopt AUTO_LIST
# setopt AUTO_REMOVE_SLASH
# setopt AUTO_RESUME
# setopt CORRECT
# setopt HASH_CMDS
# setopt MENUCOMPLETE
# setopt INC_APPEND_HISTORY SHARE_HISTORY
# setopt APPEND_HISTORY
# unsetopt BG_NICE
# setopt EXTENDED_HISTORY
# setopt ALL_EXPORT

#setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS





############################
### Set/unset  shell options
############################
#setopt   notify globdots correct pushdtohome cdablevars autolist
#setopt   correctall autocd recexact longlistjobs
#setopt   autoresume histignoredups pushdsilent 
#setopt   autopushd pushdminus extendedglob rcquotes mailwarning
#unsetopt bgnice autoparamslash

#################################################
### Autoload zsh modules when they are referenced
#################################################
#zmodload -ap zsh/mapfile mapfile
#autoload -U history-search-end
#zmodload -a zsh/stat stat
#zmodload -a zsh/zpty zpty
#zmodload -a zsh/zprof zprof
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end

#################
### Set variables
#################
PATH="/usr/local/bin:/usr/local/sbin/:$PATH"
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
HOSTNAME="'hostname'"
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';

###############
### Load colors
###############
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
   colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
   eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
   (( count = $count + 1 ))
done

##############
### Set prompt
##############
#autoload -Uz promptinit
#promptinit
PR_NO_COLOR="%{$terminfo[sgr0]%}"
PS1="[%(!.${PR_RED}%2c.${PR_BLUE}%2c)$PR_NO_COLOR]%(?..[${PR_LIGHT_RED}%?$PR_NO_COLOR])%(!.${PR_LIGHT_RED}#.${PR_LIGHT_GREEN}>) "
#RPS1="$PR_LIGHT_YELLOW(%D{%m-%d %H:%M})$PR_NO_COLOR"
unsetopt ALL_EXPORT

#############
### Bind keys
#############
#bindkey "^[[A" history-beginning-search-backward-end
#bindkey "^[[B" history-beginning-search-forward-end
#bindkey "^r" history-incremental-search-backward

bindkey "^?" backward-delete-char
bindkey '~' delete-char
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand
bindkey ";5C" forward-word
bindkey ";5D" backward-word

#################
###Autocompletado
#################
autoload -Uz compinit
compinit

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

#Habilita el doble tab para autocompletado
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Completion Styles

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
    
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

##########

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# command for process lists, the local web server details and host completion
# on processes completion complete all user processes
zstyle ':completion:*:processes' command 'ps -au$USER'

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

#NEW completion:
# 1. All /etc/hosts hostnames are in autocomplete
# 2. If you have a comment in /etc/hosts like #%foobar.domain,
#    then foobar.domain will show up in autocomplete!
#zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}') 
# Filename suffixes to ignore during completion (except after rm command)
#zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
#    '*?.old' '*?.pro'


# ignore completion functions (until the _ignored completer)
# zstyle ':completion:*:functions' ignored-patterns '_*'
# zstyle ':completion:*:*:*:users' ignored-patterns \
#        adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
#        named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
#        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs avahi-autoipd\
#        avahi backup messagebus beagleindex debian-tor dhcp dnsmasq fetchmail\
#        firebird gnats haldaemon hplip irc klog list man cupsys postfix\
#        proxy syslog www-data mldonkey sys snort

# SSH Completion
# zstyle ':completion:*:scp:*' tag-order \
#   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
# zstyle ':completion:*:scp:*' group-order \
#   files all-files users hosts-domain hosts-host hosts-ipaddr
# zstyle ':completion:*:ssh:*' tag-order \
#   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
# zstyle ':completion:*:ssh:*' group-order \
#   hosts-domain hosts-host users hosts-ipaddr
# zstyle '*' single-ignored show


##############################################
########### CONFIGURACION PERSONAL ###########
##############################################

#############
### Set alias
#############
alias pconfig='nvim ~/.config/polybar/config'
alias sconfig='nvim ~/.config/sxhkd/sxhkdrc'
alias bconfig='nvim ~/.config/bspwm/bspwmrc'
alias zconfig='nvim ~/.zshrc'
alias comandos='nvim ~/.config/Mis_scripts/comandos'
alias rpolybar='~/.config/polybar/launch.sh'
alias internet='iwctl --passphrase 9CC8FC90AB34 station wlan0 connect IZZI-AB34'
alias internetoff='sudo ifconfig wlan0 down'
alias bateria='~/.config/Mis_scripts/bateria.sh'
alias ls='ls --color=auto'
alias mirepo='rm ~/linux -R -f & git clone https://github.com/codallos/linux.git'
alias ipconfig='nmcli -p device show'
alias casa='cd ~'
alias terminal='tilix & disown'
alias nconfig='nvim ~/.config/nvim/init.vim'
##################
### Source plugins
##################

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-sudo/sudo-plugin.zsh
##################
##### Habilita fzf
##################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#######################
###Funciones personales
#######################
# Set 'man' colors
function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}

# fzf improvement
function fzf-lovely(){

	if [ "$1" = "h" ]; then
		fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
 	                echo {} is a binary file ||
	                 (bat --style=numbers --color=always {} ||
	                  highlight -O ansi -l {} ||
	                  coderay {} ||
	                  rougify {} ||
	                  cat {}) 2> /dev/null | head -500'

	else
	        fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
	                         echo {} is a binary file ||
	                         (bat --style=numbers --color=always {} ||
	                          highlight -O ansi -l {} ||
	                          coderay {} ||
	                          rougify {} ||
	                          cat {}) 2> /dev/null | head -500'
	fi
}


# Set 'limpiar duplicados en el historial' colors
function limpiahistorial() {
    awk -i inplace '!x[$0]++' ~/.zsh_history
}

limpiahistorial
setopt HIST_SAVE_NO_DUPS
#setopt
# Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e

# lf icons
export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
