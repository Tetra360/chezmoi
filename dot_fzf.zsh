# Setup fzf
# -------------------

# OS を判別して FZF のパスを設定
if [[ "$(uname)" == "Darwin" ]]; then
  # macOS の場合
  FZF_PATH="/opt/homebrew/opt/fzf/bin"
  echo ">>> macOS 用の環境変数を読み込み fzf"
elif [[ "$(uname)" == "Linux" ]]; then
  # Linux の場合
  FZF_PATH="/home/linuxbrew/.linuxbrew/opt/fzf/bin"
  echo ">>> Linux 用の環境変数を読み込み fzf"
fi

# $PATH に FZF_PATH が含まれていない場合は追加
if [[ ! "$PATH" == *"$FZF_PATH"* ]]; then
  PATH="${PATH:+${PATH}:}$FZF_PATH"
fi

# FZF を Zsh に読み込む
source <(fzf --zsh)

# h コマンドでヒストリーから選択して実行
alias h='history | fzf --tac --height 40% --reverse | awk '\''{print substr($0, index($0,$2))}'\'' | xargs -I{} zsh -c "{}"'
