#!/usr/bin/env bash
set -xe

# 脚本路径
sc_dir="$(
  cd "$(dirname "$0")" >/dev/null 2>&1 || exit
  pwd -P
)"

rs_path=${sc_dir/ComfyUI*/ComfyUI}
source $rs_path/bin/libs/headers.sh

Case=${1:-logs}

ebc_debug "解析命令参数> model.sh $Case"

case "$Case" in
help)
  ebc_debug "说明: model.sh 命令快捷参数"
  ebc_debug "用法: model.sh <Case>"
  ebc_debug "示例: model.sh install"
  ;;
install)
  modelscope download --model Comfy-Org/stable-diffusion-v1-5-archive
  modelscope download --model Comfy-Org/stable-diffusion-v1-5-archive v1-5-pruned-emaonly-fp16.safetensors
;;
*)
  echo "[参数命令不合法]case: $Case [install]"
  exit 1
  ;;
esac
