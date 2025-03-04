#!/usr/bin/env bash
set -xe

sc_dir="$(
  cd "$(dirname "$0")" >/dev/null 2>&1 || exit
  pwd -P
)"

rs_path=${sc_dir/ComfyUI*/ComfyUI}
source $rs_path/bin/libs/headers.sh

Case=${1:-restart}
Env=${2:-local}

ebc_debug "解析命令参数> run.sh $Case $Env"

{ [ "$Env" != "local" ] && [ "$Env" != "dev" ] && [ "$Env" != "test" ] && [ "$Env" != "beta" ] && [ "$Env" != "prod" ] && [ "$Env" != "private" ]; } && echo "参数[1: $1]不合法!" && exit

case "$Case" in
help)
  ebc_debug "说明: run.sh 命令快捷参数"
  ebc_debug "用法: run.sh <Case> <Env>"
  ebc_debug "示例: run.sh restart dev"
  ;;
init)
  pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu126
  pip install -r requirements.txt
 ;;
install)
  git clone git@github.com:ltdrdata/ComfyUI-Manager.git custom_nodes/comfyui-manager
;;
start)
  python main.py --port 6006 --listen 0.0.0.0
 ;;
restart)
  kill -9 $(lsof -t -i:6006)
  python main.py --port 6006 --listen 0.0.0.0
 ;;
*)
  echo "[参数命令不合法]case: $Case [remove]"
  exit 1
  ;;
esac
