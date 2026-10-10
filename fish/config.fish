
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
    # 工作区：基于 $HOME，不写死用户名；目录不存在则不导出（便于换机器）
    if test -d $HOME/WorkSpace
        set -gx WorkSpace $HOME/WorkSpace
        set -gx NEMU_HOME $WorkSpace/learn/ics2024/nemu
        set -gx AM_HOME $WorkSpace/learn/ics2024/abstract-machine
    end
end

export MANPAGER='nvim +Man!'
fish_add_path ~/.local/bin
# ~/.cargo 由 conf.d/rustup.fish 处理（source ~/.cargo/env.fish），这里不再重复
fish_add_path ~/Software/arm-none-eabi/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
fish_add_path ~/.opencode/bin
