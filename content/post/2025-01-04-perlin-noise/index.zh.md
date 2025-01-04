---
title: 柏林噪声
author: gaoch
date: '2025-01-04'
slug: perlin-noise
categories:
  - 信息技术
tags:
  - R
---

最近看视频了解到有一个可用于生成游戏地图中地形、环境差异的算法，听起来像是以德国地名命名的噪音算法——**柏林噪声**。

它的名字原本叫做 **Perlin Noise**，由 Ken Perlin 发明并以他的名字命名。虽然听起来与德国地名有关，但实际上与地名无关，而是对 **Perlin Noise** 的音译误读。柏林噪音是生成自然纹理（如地形、云层和水流）最常用的噪声算法之一，广泛用于游戏开发和计算机图形学中。

“柏林噪音”是一种常用于生成自然纹理的伪随机噪声算法，尤其适合生成游戏地图中的地形、高度图、云层等。

Perlin Noise 的特点包括：

- **平滑性**：相比纯粹的随机噪声，Perlin Noise 是一种连续的噪声，可以生成自然的、无明显断点的纹理。
- **多分辨率特性**：通过组合不同尺度的 Perlin Noise，可以生成更复杂的分形纹理，适用于模拟自然现象。
- **高效性**：设计时兼顾了计算效率，适合实时生成大规模地图。

## 生成柏林噪声的实例

以下是使用 R 生成和可视化 Perlin 噪音（“柏林噪音”）的代码。我们将使用 `ambient` 和 `ggplot2` 包来生成和展示噪声图案。

### 安装依赖包

`ambient` 是生成柏林噪声的 R 语言软件包。如果尚未安装，可以运行以下代码：

```r
install.packages("ambient")
```

`ambient` 包提供了生成多种噪声模式的函数，包括 Perlin 噪声、Simplex 噪声等。在这里，我们将使用 `gen_perlin` 函数生成 Perlin 噪声。

### 生成和可视化 Perlin 噪音


``` r
# 加载必要的包
library(ambient)
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

``` r
library(ggplot2)

# 设置噪音网格大小
grid_size = 200

# 生成 Perlin 噪音
noise_data = long_grid(x = seq(0, 5, length.out = grid_size), 
                       y = seq(0, 5, length.out = grid_size)) |>
  mutate(value = gen_perlin(x, y, frequency = 1, seed = 42))

# 使用 ggplot2 可视化
ggplot(noise_data, aes(x, y, fill = value)) +
  geom_raster() +
  scale_fill_viridis_c() +
  coord_equal() +
  theme_minimal() +
  labs(title = "Perlin Noise Visualization", fill = "Value")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-1-1.png" width="672" />

### 代码解释

1. **`long_grid`**：生成一个二维网格，`x` 和 `y` 定义了网格的范围和密度。
2. **`gen_perlin`**：生成 Perlin 噪音，支持设置频率和种子以控制噪音的细节和重复性。
3. **`geom_raster`**：绘制栅格图，适合显示二维噪音数据。
4. **`scale_fill_viridis_c`**：使用 Viridis 配色方案，增强可读性。

### 运行效果

代码将生成一个平滑、连续的 Perlin 噪音图，可用于地图生成、地形建模或其他游戏开发用途。你可以调整网格大小（`grid_size`）、频率（`frequency`）和种子值（`seed`）以获得不同的效果。

## 使用 `ambient` 包生成更多噪声

### Simplex 噪声

Simplex 噪声是 Perlin 噪声的改进版本，具有更高的计算效率和更好的平滑性。在 `ambient` 包中，我们可以使用 `gen_simplex` 函数生成 Simplex 噪声。


``` r
# 生成 Simplex 噪音
noise_data = long_grid(x = seq(0, 5, length.out = grid_size), 
                       y = seq(0, 5, length.out = grid_size)) |>
  mutate(value = gen_simplex(x, y, frequency = 1, seed = 42))

# 使用 ggplot2 可视化
ggplot(noise_data, aes(x, y, fill = value)) +
  geom_raster() +
  scale_fill_viridis_c() +
  coord_equal() +
  theme_minimal() +
  labs(title = "Simplex Noise Visualization", fill = "Value")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-2-1.png" width="672" />


### Worley 噪声

Worley 噪声是一种基于点的噪声算法，通过计算每个点到最近的若干个种子点的距离来生成噪声。在 `ambient` 包中，我们可以使用 `gen_worley` 函数生成 Worley 噪声。


``` r
# 生成 Worley 噪音
noise_data = long_grid(x = seq(0, 5, length.out = grid_size), 
                       y = seq(0, 5, length.out = grid_size)) |>
  mutate(value = gen_worley(x, y, frequency = 1, seed = 42))

# 使用 ggplot2 可视化
ggplot(noise_data, aes(x, y, fill = value)) +
  geom_raster() +
  scale_fill_viridis_c() +
  coord_equal() +
  theme_minimal() +
  labs(title = "Worley Noise Visualization", fill = "Value")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-3-1.png" width="672" />

### Value 噪声

Value 噪声是一种简单的噪声算法，通过在网格点上生成随机值并进行插值来生成噪声。在 `ambient` 包中，我们可以使用 `gen_value` 函数生成 Value 噪声。


``` r
# 生成 Value 噪音
noise_data = long_grid(x = seq(0, 5, length.out = grid_size), 
                       y = seq(0, 5, length.out = grid_size)) |>
  mutate(value = gen_value(x, y, frequency = 1, seed = 42))

# 使用 ggplot2 可视化
ggplot(noise_data, aes(x, y, fill = value)) +
  geom_raster() +
  scale_fill_viridis_c() +
  coord_equal() +
  theme_minimal() +
  labs(title = "Value Noise Visualization", fill = "Value")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-4-1.png" width="672" />


### Cubic 噪声

Cubic 噪声是一种基于立方插值的噪声算法，通过在网格点上生成随机值并进行立方插值来生成噪声。在 `ambient` 包中，我们可以使用 `gen_cubic` 函数生成 Cubic 噪声。


``` r
# 生成 Cubic 噪音
noise_data = long_grid(x = seq(0, 5, length.out = grid_size), 
                       y = seq(0, 5, length.out = grid_size)) |>
  mutate(value = gen_cubic(x, y, frequency = 1, seed = 42))

# 使用 ggplot2 可视化
ggplot(noise_data, aes(x, y, fill = value)) +
  geom_raster() +
  scale_fill_viridis_c() +
  coord_equal() +
  theme_minimal() +
  labs(title = "Cubic Noise Visualization", fill = "Value")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-5-1.png" width="672" />

### Waves 噪声

Waves 噪声是一种基于正弦波的噪声算法，通过在网格点上生成正弦波并进行插值来生成噪声。在 `ambient` 包中，我们可以使用 `gen_waves` 函数生成 Waves 噪声。


``` r
# 生成 Waves 噪音
noise_data = long_grid(x = seq(0, 5, length.out = grid_size), 
                       y = seq(0, 5, length.out = grid_size)) |>
  mutate(value = gen_waves(x, y, frequency = 1, seed = 42))

# 使用 ggplot2 可视化
ggplot(noise_data, aes(x, y, fill = value)) +
  geom_raster() +
  scale_fill_viridis_c() +
  coord_equal() +
  theme_minimal() +
  labs(title = "Waves Noise Visualization", fill = "Value")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-6-1.png" width="672" />

### 生成 checkerborad 模式

Checkerboard 模式是一种简单的噪声模式，通过在网格点上生成交替的黑白格子来生成噪声。在 `ambient` 包中，我们可以使用 `gen_checkerboard` 函数生成 Checkerboard 噪声。


``` r
# 生成 Checkerboard 噪音
noise_data = long_grid(x = seq(0, 5, length.out = grid_size), 
                       y = seq(0, 5, length.out = grid_size)) |>
  mutate(value = gen_checkerboard(x, y, frequency = 1, seed = 42))

# 使用 ggplot2 可视化
ggplot(noise_data, aes(x, y, fill = value)) +
  geom_raster() +
  scale_fill_viridis_c() +
  coord_equal() +
  theme_minimal() +
  labs(title = "Checkerboard Noise Visualization", fill = "Value")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-7-1.png" width="672" />


### 生成 spheres 模式

Spheres 模式是一种基于球体的噪声模式，通过在网格点上生成球体并进行插值来生成噪声。在 `ambient` 包中，我们可以使用 `gen_spheres` 函数生成 Spheres 噪声。


``` r
# 生成 Spheres 噪音
noise_data = long_grid(x = seq(0, 5, length.out = grid_size), 
                       y = seq(0, 5, length.out = grid_size)) |>
  mutate(value = gen_spheres(x, y, frequency = 1, seed = 42))

# 使用 ggplot2 可视化
ggplot(noise_data, aes(x, y, fill = value)) +
  geom_raster() +
  scale_fill_viridis_c() +
  coord_equal() +
  theme_minimal() +
  labs(title = "Spheres Noise Visualization", fill = "Value")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-8-1.png" width="672" />

### 组合噪声

将柏林噪声与 Worley 噪声、Value 噪声等组合在一起，可以生成更加复杂的噪声模式。

以下是结合 **Perlin 噪声**、**Worley 噪声** 和 **Value 噪声** 的方法，生成复杂的噪声图案并可视化。我们继续使用 R 中的 `ambient` 和 `ggplot2` 包实现。

### 代码实现


``` r
# 设置网格大小和范围
grid_size = 200
x_range = seq(0, 5, length.out = grid_size)
y_range = seq(0, 5, length.out = grid_size)

# 创建网格
noise_data = long_grid(x = x_range, y = y_range)

# 生成 Perlin 噪声
noise_data = noise_data |>
  mutate(perlin = gen_perlin(x, y, frequency = 2, seed = 42))

# 生成 Worley 噪声
noise_data = noise_data |>
  mutate(worley = gen_worley(x, y, frequency = 2, seed = 42, value = "distance"))

# 生成 Value 噪声
noise_data = noise_data |>
  mutate(value_noise = gen_value(x, y, frequency = 2, seed = 42))

# 合并噪声（例如取加权平均或乘积）
noise_data = noise_data |>
  mutate(combined = 0.4 * perlin + 0.4 * worley + 0.2 * value_noise)

# 可视化
ggplot(noise_data, aes(x, y, fill = combined)) +
  geom_raster() +
  scale_fill_viridis_c() +
  coord_equal() +
  theme_minimal() +
  labs(title = "Combined Noise: Perlin, Worley, and Value", fill = "Value")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-9-1.png" width="672" />


