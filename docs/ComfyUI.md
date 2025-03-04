# ComfyUI

## 安装

```bash
git clone git@github.com:comfyanonymous/ComfyUI.git
```

## Nvidia GPU 安装以下依赖

```bash
pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu126
```

安装依赖

```bash
pip install -r requirements.txt
```

## 启动服务

```bash
python main.py --port 6006 --listen 0.0.0.0
```

## 安装 ComfyUI-Manager 

```bash
cd ComfyUI/custom_nodes
git clone git@github.com:ltdrdata/ComfyUI-Manager.git comfyui-manager
```

重启 ComfyUI 服务

## 其它

下载模型

```bash
cd ComfyUI/models/checkpoints
https://huggingface.co/Comfy-Org/stable-diffusion-v1-5-archive/resolve/main/v1-5-pruned-emaonly-fp16.safetensors
wget https://hf-mirror.com/Comfy-Org/stable-diffusion-v1-5-archive/resolve/main/v1-5-pruned-emaonly-fp16.safetensors
```

```bash
modelscope download --model Comfy-Org/stable-diffusion-v1-5-archive
modelscope download --model Comfy-Org/stable-diffusion-v1-5-archive v1-5-pruned-emaonly-fp16.safetensors
```