
function fish_greeting
	echo 'Nice to meet you!'
end

function fish_right_prompt
  set_color $fish_color_autosuggestion 2> /dev/null; or set_color 555
  date "+%H:%M:%S"
  set_color normal
end

function yy
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if test -s "$tmp" # 检查文件是否非空
        set -l cwd (cat "$tmp")
        if test "$cwd" != "$PWD"
            cd "$cwd"
        end
    end
    rm -f "$tmp"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
	fenv source ~/.profile
	export NEMU_HOME=/home/mxuan/WorkSpace/learn/ics2024/nemu
	export AM_HOME=/home/mxuan/WorkSpace/learn/ics2024/abstract-machine
end

