---
title: 绘制随机森林模型的Gini重要性
author: gaoch
date: '2024-11-26'
slug: random-forest-gini-index
categories:
  - 其它
  - 信息技术
tags:
  - 学习笔记
  - 机器学习
---

在随机森林模型中，`mean decrease in gini index`（也称为Gini重要性或基尼指数下降均值）用于衡量各特征对模型分类性能的贡献。

## 输出解释

- 每个柱状条的高度表示该特征对分类器性能的相对贡献，数值越大表示重要性越高。
- 特征可以按重要性从高到低排序，以便更直观地理解哪些变量在模型中最重要。

可以通过以下步骤绘制它：

## Python 示例

假设使用的是 `scikit-learn` 的随机森林实现：

``` python
import matplotlib.pyplot as plt
import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn.datasets import load_iris

# 加载数据集
data = load_iris()
X = data.data
y = data.target
feature_names = data.feature_names

# 训练随机森林模型
rf = RandomForestClassifier(n_estimators=100, random_state=42)
rf.fit(X, y)
```

<style>#sk-container-id-1 {color: black;background-color: white;}#sk-container-id-1 pre{padding: 0;}#sk-container-id-1 div.sk-toggleable {background-color: white;}#sk-container-id-1 label.sk-toggleable__label {cursor: pointer;display: block;width: 100%;margin-bottom: 0;padding: 0.3em;box-sizing: border-box;text-align: center;}#sk-container-id-1 label.sk-toggleable__label-arrow:before {content: "▸";float: left;margin-right: 0.25em;color: #696969;}#sk-container-id-1 label.sk-toggleable__label-arrow:hover:before {color: black;}#sk-container-id-1 div.sk-estimator:hover label.sk-toggleable__label-arrow:before {color: black;}#sk-container-id-1 div.sk-toggleable__content {max-height: 0;max-width: 0;overflow: hidden;text-align: left;background-color: #f0f8ff;}#sk-container-id-1 div.sk-toggleable__content pre {margin: 0.2em;color: black;border-radius: 0.25em;background-color: #f0f8ff;}#sk-container-id-1 input.sk-toggleable__control:checked~div.sk-toggleable__content {max-height: 200px;max-width: 100%;overflow: auto;}#sk-container-id-1 input.sk-toggleable__control:checked~label.sk-toggleable__label-arrow:before {content: "▾";}#sk-container-id-1 div.sk-estimator input.sk-toggleable__control:checked~label.sk-toggleable__label {background-color: #d4ebff;}#sk-container-id-1 div.sk-label input.sk-toggleable__control:checked~label.sk-toggleable__label {background-color: #d4ebff;}#sk-container-id-1 input.sk-hidden--visually {border: 0;clip: rect(1px 1px 1px 1px);clip: rect(1px, 1px, 1px, 1px);height: 1px;margin: -1px;overflow: hidden;padding: 0;position: absolute;width: 1px;}#sk-container-id-1 div.sk-estimator {font-family: monospace;background-color: #f0f8ff;border: 1px dotted black;border-radius: 0.25em;box-sizing: border-box;margin-bottom: 0.5em;}#sk-container-id-1 div.sk-estimator:hover {background-color: #d4ebff;}#sk-container-id-1 div.sk-parallel-item::after {content: "";width: 100%;border-bottom: 1px solid gray;flex-grow: 1;}#sk-container-id-1 div.sk-label:hover label.sk-toggleable__label {background-color: #d4ebff;}#sk-container-id-1 div.sk-serial::before {content: "";position: absolute;border-left: 1px solid gray;box-sizing: border-box;top: 0;bottom: 0;left: 50%;z-index: 0;}#sk-container-id-1 div.sk-serial {display: flex;flex-direction: column;align-items: center;background-color: white;padding-right: 0.2em;padding-left: 0.2em;position: relative;}#sk-container-id-1 div.sk-item {position: relative;z-index: 1;}#sk-container-id-1 div.sk-parallel {display: flex;align-items: stretch;justify-content: center;background-color: white;position: relative;}#sk-container-id-1 div.sk-item::before, #sk-container-id-1 div.sk-parallel-item::before {content: "";position: absolute;border-left: 1px solid gray;box-sizing: border-box;top: 0;bottom: 0;left: 50%;z-index: -1;}#sk-container-id-1 div.sk-parallel-item {display: flex;flex-direction: column;z-index: 1;position: relative;background-color: white;}#sk-container-id-1 div.sk-parallel-item:first-child::after {align-self: flex-end;width: 50%;}#sk-container-id-1 div.sk-parallel-item:last-child::after {align-self: flex-start;width: 50%;}#sk-container-id-1 div.sk-parallel-item:only-child::after {width: 0;}#sk-container-id-1 div.sk-dashed-wrapped {border: 1px dashed gray;margin: 0 0.4em 0.5em 0.4em;box-sizing: border-box;padding-bottom: 0.4em;background-color: white;}#sk-container-id-1 div.sk-label label {font-family: monospace;font-weight: bold;display: inline-block;line-height: 1.2em;}#sk-container-id-1 div.sk-label-container {text-align: center;}#sk-container-id-1 div.sk-container {/* jupyter's `normalize.less` sets `[hidden] { display: none; }` but bootstrap.min.css set `[hidden] { display: none !important; }` so we also need the `!important` here to be able to override the default hidden behavior on the sphinx rendered scikit-learn.org. See: https://github.com/scikit-learn/scikit-learn/issues/21755 */display: inline-block !important;position: relative;}#sk-container-id-1 div.sk-text-repr-fallback {display: none;}</style><div id="sk-container-id-1" class="sk-top-container"><div class="sk-text-repr-fallback"><pre>RandomForestClassifier(random_state=42)</pre><b>In a Jupyter environment, please rerun this cell to show the HTML representation or trust the notebook. <br />On GitHub, the HTML representation is unable to render, please try loading this page with nbviewer.org.</b></div><div class="sk-container" hidden><div class="sk-item"><div class="sk-estimator sk-toggleable"><input class="sk-toggleable__control sk-hidden--visually" id="sk-estimator-id-1" type="checkbox" checked><label for="sk-estimator-id-1" class="sk-toggleable__label sk-toggleable__label-arrow">RandomForestClassifier</label><div class="sk-toggleable__content"><pre>RandomForestClassifier(random_state=42)</pre></div></div></div></div></div>

``` python
# 获取 Gini 重要性
importances = rf.feature_importances_

# 对特征重要性排序
indices = np.argsort(importances)[::-1]

# 绘制柱状图
plt.figure(figsize=(10, 6))
plt.title("Feature Importance (Mean Decrease in Gini Index)")
plt.bar(range(X.shape[1]), importances[indices], align="center")
plt.xticks(range(X.shape[1]), [feature_names[i] for i in indices])
```

    ## ([<matplotlib.axis.XTick object at 0x1690cd650>, <matplotlib.axis.XTick object at 0x1690dc5d0>, <matplotlib.axis.XTick object at 0x1690dd110>, <matplotlib.axis.XTick object at 0x169142f90>], [Text(0, 0, 'petal length (cm)'), Text(1, 0, 'petal width (cm)'), Text(2, 0, 'sepal length (cm)'), Text(3, 0, 'sepal width (cm)')])

``` python
plt.xlabel("Features")
plt.ylabel("Importance Score")
plt.tight_layout()
plt.show()
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-1-1.png" width="960" />

## R 示例

在 R 中，可以使用 `randomForest` 包来计算和绘制 `Mean Decrease in Gini`：

``` r
library(randomForest)
```

    ## randomForest 4.7-1.1

    ## Type rfNews() to see new features/changes/bug fixes.

``` r
# 加载示例数据集
data(iris)
set.seed(42)

# 训练随机森林模型
rf_model = randomForest(Species ~ ., data = iris, importance = TRUE)

# 提取 Gini 重要性
importance_data = importance(rf_model, type = 2)
feature_names = rownames(importance_data)

# 排序数据
sorted_indices = order(importance_data[, "MeanDecreaseGini"], decreasing = TRUE)
sorted_importance = importance_data[sorted_indices, "MeanDecreaseGini"]
sorted_feature_names = feature_names[sorted_indices]

# 绘制柱状图
barplot(sorted_importance,
        names.arg = sorted_feature_names,
        las = 2, col = "steelblue",
        main = "Feature Importance (Mean Decrease in Gini Index)",
        xlab = "Features", ylab = "Importance Score",
        cex.names = 0.8) # 缩小标签字体以避免重叠
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-2-3.png" width="672" />

## 使用 `tidymodels` 框架

使用 `tidymodels` 框架，可以通过 `vip`（Variable Importance Plots）包来绘制随机森林模型的 `Mean Decrease in Gini Index`。以下是实现方法：

### 安装必要的包

确保安装以下包：

``` r
install.packages("tidymodels")
install.packages("vip")
```

### 示例代码

以下以 `iris` 数据集为例：

``` r
library(tidymodels)
```

    ## ── Attaching packages ────────────────────────────────────── tidymodels 1.1.1 ──

    ## ✔ broom        1.0.5     ✔ recipes      1.0.9
    ## ✔ dials        1.2.0     ✔ rsample      1.2.0
    ## ✔ dplyr        1.1.4     ✔ tibble       3.2.1
    ## ✔ ggplot2      3.5.1     ✔ tidyr        1.3.1
    ## ✔ infer        1.0.5     ✔ tune         1.1.2
    ## ✔ modeldata    1.2.0     ✔ workflows    1.1.3
    ## ✔ parsnip      1.1.1     ✔ workflowsets 1.0.1
    ## ✔ purrr        1.0.2     ✔ yardstick    1.2.0

    ## ── Conflicts ───────────────────────────────────────── tidymodels_conflicts() ──
    ## ✖ dplyr::combine()  masks randomForest::combine()
    ## ✖ purrr::discard()  masks scales::discard()
    ## ✖ dplyr::filter()   masks stats::filter()
    ## ✖ dplyr::lag()      masks stats::lag()
    ## ✖ ggplot2::margin() masks randomForest::margin()
    ## ✖ recipes::step()   masks stats::step()
    ## • Use tidymodels_prefer() to resolve common conflicts.

``` r
library(vip)
```

    ## 
    ## Attaching package: 'vip'

    ## The following object is masked from 'package:utils':
    ## 
    ##     vi

``` r
# 加载数据集
data(iris)

# 定义数据拆分
set.seed(42)
iris_split = initial_split(iris, prop = 0.8)
iris_train = training(iris_split)
iris_test = testing(iris_split)

# 定义随机森林模型
rf_model = rand_forest(mtry = 2, trees = 100, min_n = 5) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("classification")

# 定义工作流
rf_workflow = workflow() %>%
  add_model(rf_model) %>%
  add_formula(Species ~ .)

# 训练模型
rf_fit = fit(rf_workflow, data = iris_train)

# 提取变量重要性并绘图
rf_fit %>%
  extract_fit_parsnip() %>%
  vip(geom = "col", aesthetics = list(fill = "steelblue")) +
  labs(
    title = "Feature Importance (Mean Decrease in Gini Index)",
    x = "Features",
    y = "Importance Score"
  ) +
  theme_minimal()
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-3-1.png" width="672" />

### 输出解释

- `vip()` 函数会从模型中提取特征的重要性并绘制柱状图。
- 这里使用了 `ranger` 引擎，通过 `importance = "impurity"` 参数计算基尼指数下降。
- `geom = "col"` 绘制柱状图，并可以通过 `aesthetics` 自定义样式。

### 代码关键点

1.  **`vip` 包**：方便地绘制变量重要性。
2.  **随机森林引擎**：选择 `ranger`，因为它支持计算基尼重要性。
3.  **工作流**：使用 `tidymodels` 的工作流整合模型和预处理过程。
