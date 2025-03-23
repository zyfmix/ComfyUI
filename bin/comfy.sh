#!/usr/bin/env bash
set -xe

sc_dir="$(
  cd "$(dirname "$0")" >/dev/null 2>&1 || exit
  pwd -P
)"

rs_path=${sc_dir/ComfyUI*/ComfyUI}
source $rs_path/bin/libs/headers.sh

Case=${1:-restart}

ebc_debug "解析命令参数> comfy.sh $Case"

case "$Case" in
help)
  ebc_debug "说明: comfy.sh 命令快捷参数"
  ebc_debug "用法: comfy.sh <Case>"
  ebc_debug "示例: comfy.sh fetch"
  ;;
init)
  git remote add upstream git@github.com:comfyanonymous/ComfyUI.git
 ;;
fetch)
  git fetch --tags upstream
  git push --tags
 ;;
*)
  echo "[参数命令不合法]case: $Case [init]"
  exit 1
  ;;
esac
