### Some PS1 

```
PS1='\[\033[0;32m\]\D{%H:%M:%S} \[\033[0;36m\]\u@\h \[\033[1;33m\]> \[\033[0;37m\]\w\$ '

PS1='\[\033[0;36m\][\u@\h] \[\033[0;32m\]@ [\D{%H:%M:%S}] \[\033[1;33m\]> \[\033[0;37m\][\w] \$ '

PS1='\[\033[0;34m\][\u@\h] \[\033[1;33m\]@ \[\033[0;32m\][\D{%H:%M:%S}] \[\033[1;33m\]> \[\033[0;37m\][\w]\$ '

PS1='\[\033[0;34m\][\u@\h] \[\033[1;33m\]@ \[\033[0;32m\][\D{%H:%M:%S}] \[\033[1;33m\]> \[\033[0;37m\][\w]\$ '
```

---

### Coloring for grep 

```
alias grep='grep --color=auto'
```
# Highlight search in grep


---


### Increase history size and include timestamps

```
HISTSIZE=10000                           # Number of commands stored in memory
HISTFILESIZE=50000                       # Number of commands stored in .bash_history
HISTTIMEFORMAT="%F %T "                  # Add timestamp to history
shopt -s histappend                      # Append history instead of overwriting
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND" # Write history after every command
```


all of these configurations were made for debian
