# YGrobot Desktop 本地开发

## 启动开发版

在项目根目录打开 PowerShell，执行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\dev.ps1
```

这个脚本会固定使用 `E:\YGrobot-Dev\tools\node-v16.20.2-win-x64` 中的 Node.js 16，并启动 Electron 的开发模式。不要直接用系统 Node.js 24 执行 `npm start`，当前的 Webpack 4 依赖会因此出现 OpenSSL 错误。

开发窗口打开后，保持 PowerShell 窗口运行；它负责监听源码变化。

## 修改后如何看到效果

| 修改范围 | 一般效果 | 是否需要手动重启 |
| --- | --- | --- |
| `src/renderer/` 中的 React 页面、CSS、图标引用 | 开发窗口自动刷新或热更新 | 通常不需要 |
| `src/main/` 中的 Electron 主进程代码 | 窗口、菜单、IPC 等逻辑变更 | 需要 |
| `package.json`、`electron-builder.yaml` | 产品配置、打包配置 | 需要；安装包效果还需要重新构建 |
| `buildResources/*.ico` | Windows 安装后 exe 图标 | 需要重新构建安装包 |

## 手动重启开发版

1. 在运行 `dev.ps1` 的 PowerShell 窗口按 `Ctrl+C`。
2. 如 Electron 窗口还在，关闭该窗口。
3. 再执行一次启动命令。

每次开始新功能前，先启动开发版；修改一个小目标后立刻观察效果。这是最短的“写代码 → 运行 → 验证 → 再修改”开发循环。
