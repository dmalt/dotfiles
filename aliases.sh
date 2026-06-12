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

# prereqs: brew install shntool cuetools flac; pipx install chardet
# usage: splitflac [encoding-override]   e.g. splitflac cp1251
function splitflac() {
    local cue flac enc_override="${1:-}"
    for f in *.cue;  do [ -f "$f" ] && cue="$f"  && break; done
    for f in *.flac; do [ -f "$f" ] && flac="$f" && break; done
    if [ -z "$cue" ] || [ -z "$flac" ]; then
        echo "splitflac: need one .cue and one .flac in cwd" >&2
        return 1
    fi

    # cue files are often not UTF-8 (Windows-1251, Latin-1, Shift-JIS...)
    # normalize so cuetag doesn't write mojibake into the split tags.
    # `file --mime-encoding` can't distinguish cp1251 from iso-8859-1 (same
    # byte range), so prefer chardetect which inspects byte statistics.
    local enc
    if [ -n "$enc_override" ]; then
        enc="$enc_override"
    elif command -v chardetect >/dev/null 2>&1; then
        enc=$(chardetect "$cue" | sed -E 's|^.*: ||; s| with confidence .*||')
        case "$enc" in None|"") enc=$(file -b --mime-encoding "$cue") ;; esac
    else
        enc=$(file -b --mime-encoding "$cue")
    fi
    case "$(echo "$enc" | tr '[:upper:]' '[:lower:]')" in
        utf-8|us-ascii|ascii|binary|unknown) ;;
        *) iconv -f "$enc" -t UTF-8 "$cue" > "$cue.utf8" && mv "$cue.utf8" "$cue" ;;
    esac

    mkdir -p tracks
    shnsplit -f "$cue" -o "flac flac --best -o %f -" -t "%n - %t" -d tracks "$flac" || return 1
    # drop the pre-track-1 stub shnsplit emits when the cue has INDEX 00 before track 1,
    # otherwise cuetag.sh sees N+1 files and tags every track off-by-one.
    rm -f "tracks/00 - pregap.flac"
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

# prereqs: brew install shntool cuetools flac; pipx install chardet  (ffmpeg already installed)
# usage: splitape [encoding-override]   e.g. splitape cp1251
function splitape() {
  local ape enc_override="${1:-}"
  for f in *.ape; do [ -f "$f" ] && ape="$f" && break; done
  [ -z "$ape" ] && { echo "splitape: no .ape in cwd" >&2; return 1; }

  local flac="${ape%.ape}.flac"
  ffmpeg -y -i "$ape" -c:a flac -compression_level 8 "$flac" || return 1
  splitflac "$enc_override" || return 1
  rm "$flac"   # drop the intermediate; keep original .ape as backup
}

# show embedded cover art of an audio file (flac/mp3/m4a)
function showcover() {
  local tmp
  tmp=$(mktemp -t cover).jpg
  ffmpeg -y -i "$1" -an -vcodec copy "$tmp" 2>/dev/null || {
      echo "no embedded cover in $1" >&2
      return 1
  }
  open "$tmp"
}


alias ipe='curl ipinfo.io/ip'
alias ipi="ip addr show dev wlp2s0"

alias df='df -x"squashfs"'
alias llh='ll -t | head'
alias kivi='NVIM_APPNAME="kickstart.nvim" nvim'
alias gt='cd `git rev-parse --show-toplevel`'
alias gte='gt && source .venv/bin/activate && popd'
