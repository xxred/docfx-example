# docfx示例
[![Build status](https://ci.appveyor.com/api/projects/status/psjd5g56kr0vayiw?svg=true)](https://ci.appveyor.com/project/xxred/docfx-example)

## 介绍

这个[docfx](https://github.com/dotnet/docfx)例子包含官方初始化的简单例子，增加了appveyor的配置文件`appveyor.yml`。利用此例子可以快速简单构建自己的文档/博客站点，并用markdown书写，集成appveyor自动构建部署，只需要提交修改或者直接在线修改，即可在自己的站点看到效果！

## 使用

- fork一份到自己的仓库
- 按照[这个教程](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)创建一份自己的token,然后去[appveyor官网](https://ci.appveyor.com/tools/encrypt)加密，得到最后的`access_token`
- 修改`appveyor.yml`文件，access_token替换为自己的
- `appveyor.yml`倒数大概七行这样的地方，`git clone`后面的地址换成自己的地址
- 按照[官网步骤](https://www.appveyor.com/docs/)操作，关联项目，开始构建，构建完之后访问自己的地址即可验证
- 地址格式为：`https://github.com/`
