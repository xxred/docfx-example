# docfx示例
[![Build status](https://ci.appveyor.com/api/projects/status/psjd5g56kr0vayiw?svg=true)](https://ci.appveyor.com/project/xxred/docfx-example)

## 介绍

这个[docfx](https://github.com/dotnet/docfx)例子包含官方初始化的简单例子，增加了appveyor的配置文件`appveyor.yml`。利用此例子可以快速简单构建自己的文档/博客站点，并用markdown书写，集成appveyor自动构建部署，只需要提交修改或者直接在线修改，即可在自己的站点看到效果！

## 使用

- fork一份到自己的仓库
- 打开[appveyor官网](https://ci.appveyor.com)，并使用github账号直接登陆
- 找到并点击`PROJECTS`
- 接着点击`NEW PROJECT`，在github那一栏，选择上面创建的项目，鼠标放在上面并点击`Add`
- 然后再选择的这个项目的面板，点击`NEW BUILD`
- 构建成功即可访问你的站点，站点地址格式为：`https://你的用户名/github.io/你的项目名`
