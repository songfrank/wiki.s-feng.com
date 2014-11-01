---
title: "axel: multi-thread fast downloading"
date: 2014-11-01 13:55
---

#About

[Axel](http://axel.alioth.debian.org/)使用多个链接来加速HTTP/FTP的下载。它也可以使用多个镜像地址来下载一个文件。Axel是一个不依赖别的工具的轻量级下载工具。

#Install

### For Mac OS

```bash
brew install axel
```

#Usage

```bash
axel -n 10 http://exaple.com/downloadfile.zip #开启10个连接下载
```
