# 用 eza 替代 ls
# ------------------------------------------------------------------
# fish 自带一个 ls 函数（functions/ls.fish，负责加 --color / -F）。
# 在 conf.d 里启动时定义同名函数即可覆盖它，autoload 不会再介入。
# 仅交互式会话生效：脚本/管道里仍是 coreutils 的 ls，避免参数语义差异。
#
# 若某次想用回原版：command ls ...
# ------------------------------------------------------------------

if status is-interactive; and type -q eza
    alias ls='eza --icons --group-directories-first'
    alias l='eza --icons --group-directories-first'
    alias ll='eza -l --icons --header --group-directories-first --git --time-style=long-iso'
    alias la='eza -la --icons --header --group-directories-first --git --time-style=long-iso'
    alias lt='eza --tree --icons --level=2'
end
