# Github 仓库管理

## 同步 fork 项目的 tag

先设置 `upstream`

```bash
git remote add upstream git@github.com:comfyanonymous/ComfyUI.git
```

拉取 `tags`

```bash
git fetch --tags upstream
```

将拉取的 `tags` 推送到自己的仓库

```bash
git push --tags
```

```bash
git config --global push.followTags true
git push
```