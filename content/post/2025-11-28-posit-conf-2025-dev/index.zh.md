---
title: Posit::conf(2025) 精选辑 - 软件开发
author: gaoch
date: '2025-11-28'
slug: posit-conf-2025-dev
categories:
  - 信息技术
tags:
  - R
---

## Practical {renv} (Shannon Pileggi, The PCCTC) | posit::conf(2025)

来源：<https://www.youtube.com/watch?v=l01u7Ue9pIQ>

该视频为 R 语言用户，特别是对 `renv` 包感到困惑的用户，提供了实用指南。

演讲者指出，许多用户在使用 `renv::restore()` 恢复项目环境时会遇到失败和挫败感。其核心问题通常源于 **R 版本与包版本的不匹配**。特别是，当用户尝试用一个较新版本的 R 去恢复一个使用旧版 R 创建的项目时，`renv` 往往无法找到匹配的预编译包（二进制文件），导致从源码编译失败。

演讲者将这种“新 R 版本 + 旧包版本”的组合称为生态系统中的“不自然”状态，并强烈建议避免。

为此，她提出了三种应对策略：
1.  **冻结 (Freeze)**：要处理旧项目，最可靠的方法是使用 `rig` 等工具将 R 版本**切换回项目创建时的旧版本**，然后再执行 `restore`。
2.  **管理 (Manage)**：在维持当前 R 版本不变的情况下，仅更新个别包。这是一种短期方案。
3.  **更新 (Update)**：对于活跃项目，最佳实践是定期将 R、`renv` 和所有包都更新到最新版本。这是最可持续的“快乐路径”。

**总结**：成功使用 `renv` 的关键在于理解其工作原理，并有意识地管理版本依赖，而不是盲目地依赖 `renv::restore()`。对于旧项目应“向后兼容”R 版本，对于活跃项目则应“向前更新”。


## There's a new Plumber in town (Thomas Lin Pedersen, Posit) | posit::conf(2025)

来源：<https://www.youtube.com/watch?v=Ey_gXEBte-k>

该视频介绍了 R 语言中一个全新的包 `plumber2`，它是对流行 API 框架 `plumber` 的一次彻底重写。

演讲者解释说，已有近十年历史的 `plumber` 包虽然非常成功，但积累了大量技术债，导致难以维护和添加新功能。因此，团队决定开发 `plumber2` 作为解决方案。

`plumber2` 的主要特点和新功能包括：

1.  **熟悉的体验**：对于老用户，其语法和注解方式（现基于 `Roxygen2`）依然亲切，但功能更强大。
2.  **异步执行**：通过简单的 `@async` 标签，可以轻松实现异步操作，避免耗时任务阻塞服务器。
3.  **集成 Shiny 和 Quarto**：可以直接在 `plumber2` 应用中托管和运行一个或多个 Shiny 应用及 Quarto 报告。
4.  **增强的安全性**：内置了对 CORS（跨域资源共享）等网络安全最佳实践的支持，解决了老版本中的一个常见痛点。

最后，演讲者宣布 `plumber2` 即将登陆 CRAN。原有的 `plumber` 包将继续保留，确保现有应用能正常工作，用户可以根据自己的节奏逐步迁移到新版本。



## How I got unstuck with Python (Julia Silge, Posit) | posit::conf(2025)

来源：<https://www.youtube.com/watch?v=pMVYl9fx1EE>

Posit公司的工程师Julia Silge分享了她如何克服学习Python时遇到的困难。她讲述了十年前初学Python时的挫败经历，这主要归因于两大难题：

1.  **复杂的环境管理**：当时Python的包管理工具混乱，经常导致“依赖地狱”（dependency hell）问题，让安装和管理软件包变得异常痛苦。
2.  **缺乏合适的IDE**：通用的代码编辑器对于数据科学的探索性工作流程支持不佳，而Jupyter Notebook的状态管理模式也让她因担心工作的可复现性而却步。

演讲的重点是，如今情况已大为改观。对于环境管理，她推荐使用现代化工具`uv`，它是一个极其快速、一体化的解决方案，极大地降低了环境管理的难度。对于IDE，她推荐`Positron`，这款专为数据科学设计的工具，提供了更流畅的探索性分析体验。

最后，她强调，如果你过去学习Python时感到困难，很可能不是你的问题，而是当时生态工具链的挑战所致。现在有了更好的工具，是重新尝试并“解困”Python的好时机。



