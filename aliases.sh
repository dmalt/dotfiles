#!/bin/bash
alias vi=nvim
alias history='fc -l -E 1'
alias vi='nvim'
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias du='echo REMINDER: USE ncdu!; du'
alias ncdu="ncdu --color dark -x --exclude .git --exclude node_modules"

alias lf='ls -d `ls -1t | head -1`'
alias lfd='echo ~/Downloads/`ls -1t ~/Downloads | head -1`'

function mlfd {
    mv "$(lfd)" "$1"
}


alias pp='ping -c3 google.com'


function mcd(){
    mkdir "$1"
    cd "$1" || exit
}

# prereqs: brew install shntool cuetools flac
function splitflac() {
    local cue flac
    for f in *.cue;  do [ -f "$f" ] && cue="$f"  && break; done
    for f in *.flac; do [ -f "$f" ] && flac="$f" && break; done
    if [ -z "$cue" ] || [ -z "$flac" ]; then
        echo "splitflac: need one .cue and one .flac in cwd" >&2
        return 1
    fi

    # cue files are often not UTF-8 (Windows-1251, Latin-1, Shift-JIS...)
    # normalize so cuetag doesn't write mojibake into the split tags
    local enc
    enc=$(file -b --mime-encoding "$cue")
    case "$(echo "$enc" | tr '[:upper:]' '[:lower:]')" in
        utf-8|us-ascii|binary) ;;
        *) iconv -f "$enc" -t UTF-8 "$cue" > "$cue.utf8" && mv "$cue.utf8" "$cue" ;;
    esac

    mkdir -p tracks
    shnsplit -f "$cue" -o "flac flac --best -o %f -" -t "%n - %t" -d tracks "$flac" || return 1
    cuetag.sh "$cue" tracks/*.flac

    # carry embedded cover art from source flac over to each split
    local art
    art=$(mktemp -t cover).jpg
    if metaflac --export-picture-to="$art" "$flac" 2>/dev/null; then
        for t in tracks/*.flac; do
            metaflac --import-picture-from="$art" "$t"
        done
    fi
    rm -f "$art"
}



alias ipe='curl ipinfo.io/ip'
alias ipi="ip addr show dev wlp2s0"

alias df='df -x"squashfs"'
alias llh='ll -t | head'
alias kivi='NVIM_APPNAME="kickstart.nvim" nvim'
alias gt='cd `git rev-parse --show-toplevel`'
alias gte='gt && source .venv/bin/activate && popd'
