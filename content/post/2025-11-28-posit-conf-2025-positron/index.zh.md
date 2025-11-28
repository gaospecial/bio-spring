---
title: posit::conf(2025) 精选辑 - Positron
author: gaoch
date: '2025-11-25'
slug: posit-conf-2025-positron
categories:
  - 信息技术
tags:
  - Positron
  - R
  - AI
---

posit::conf(2025) 的 Positron 部分包含了一系列精彩的讲座，涵盖了 R 语言、数据科学、人工智能等多个领域。以下是一些精选讲座的概要。

## Positron: The First Five Minutes (Isabella Velásquez, Posit) | posit::conf(2025)

来源：<https://www.youtube.com/watch?v=MOpJYbhLgyc>

这篇视频简要介绍了 Posit 公司推出的新款集成开发环境（IDE）—— Positron。

演讲者通过一个“最初五分钟”的快速演示，展示了 Positron 如何将数据科学工作流（编码、数据探索、绘图、查阅文档）整合到同一个界面中，从而减少窗口切换，提升工作效率。

演示的核心步骤包括：
1.  直接从 Git 克隆项目。
2.  运行 Python 脚本，在控制台查看输出。
3.  使用内置的**数据查看器 (Viewer)** 和**数据表格 (Data Table)**，以类似电子表格的方式交互式地排序、筛选和分析数据框。
4.  在**绘图窗口 (Plot Viewer)** 中查看生成的图表，并可以方便地在不同版本的图表间切换。
5.  在不离开 IDE 的情况下，直接调用**帮助面板 (Help Pane)** 查阅函数文档。

视频接着介绍了 Positron 灵活的界面布局，包括活动栏、编辑器、控制台以及集成了数据、绘图和帮助等功能的侧边栏。此外，还提及了 Git 集成、扩展市场、一键发布内容至 Posit Connect 以及 AI 助手（Positron Assistant）等更多高级功能。

总而言之，Positron 是一个为 R 和 Python 用户设计的强大而灵活的 IDE，旨在通过一站式工具集简化和加速整个数据科学开发流程。


## Positron AI Session (George Stagg, Winston Chang, and Tomasz Kalinowski ) | posit::conf(2025)

来源：<https://www.youtube.com/watch?v=9ZW2tx5fHjk>

本视频简要介绍了Posit的四款生成式AI工具：

1.  **Positron Assistant**: 这是一个深度集成在Positron IDE中的AI助手。它的核心优势在于能感知并利用IDE中的上下文，如控制台的错误信息、加载的数据和图表。用户可以通过它来解释数据、修复代码，并可选择三种不同权限的模式：Ask（问答）、Edit（编辑文件）和Agent（执行复杂任务，如将脚本自动打包）。

2.  **Databot**: 一个用于探索性数据分析（EDA）的聊天机器人。它能像一个分析伙伴一样，根据对话指令自动完成数据导入、生成可视化图表、创建交互式Shiny应用以及撰写Quarto分析报告，极大地简化了数据探索流程。

3.  **Ragnar**: 一个R语言包，旨在通过“检索增强生成”（RAG）技术解决大语言模型的“幻觉”问题。它可以将可信的文档（如官方文档）转换为一个知识库，让AI在回答问题前先从中检索相关信息，从而确保答案的准确性。

4.  **chatlas**: 一个Python包，功能上相当于R语言的`elmer`。它提供了一个统一的接口来连接和使用不同的大语言模型。用户可以为其提供Python函数作为“工具”来扩展其能力（如获取实时数据），并能通过Pydantic强制模型输出结构化的数据。

