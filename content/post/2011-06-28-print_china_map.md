---
title: 使用Matlab画中国地图
date: '2011-06-28'
slug: 2011-06-28-print_china_map
tags:
- 信息技术 INFORMATICS
- 原创教程 TUTORIAL
- 矩阵实验室 MATLAB
- china
- map
- MATLAB
- 地图
---


使用Matlab绘制中国地图十分方便，使用Mapping工具箱中的几条命令。

介绍如下：

**设置坐标轴：setm命令。**  
因为地球是圆的，所以地图的绘制涉及到投影的问题，跟普通的2-D或者3-D作图差别明显。setm命令专门用来设置map
axis。例如：  
\[cc lang=”matlab”\]  
ax=worldmap(‘china’); %worldmap命令生成一个map
axis，其各项属性可以用getm(ax)来获得  
setm(ax,’grid’,’off’) % 关闭grid，其实就是经线和纬线  
setm(ax,’frame’,’off’) % 关闭边框  
setm(ax,’parallellabel’,’off’) % 关闭坐标轴标记，相当于X轴  
setm(ax,’meridianlabel’,’off’) % 关闭坐标轴标记，相当于Y轴  
\[/cc\]

**绘制地图：geoshow或者mapshow**  
这两个命令差别不大，系统在判断参数的时候会自动在二者之间切换。不过他们其实还是有差别的。geoshow会根据经度和纬度来作图，如果我们的坐标轴以经纬度来标记，那么用mapshow图像就会不正确。  
例如：  
\[cc lang=”matlab”\]  
geoshow(file) % 可以直接读取文件中数据作图  
\[/cc\]  
\[cc lang=”matlab”\]  
mapshow(file) % 可以直接读取文件中数据作图  
\[/cc\]

**地图数据下载**  
中国的地图数据可以从国家基础地理信息系统的网站上下载，网址是<http://nfgis.nsdi.gov.cn/>。

**地图数据说明**  
从国家基础地理信息系统的网站上下载得到的数据，分为两种：一种以“l”结尾，经过笔者的考虑，应当是line（线，曲线）的缩写，这些数据是线性的数据，描述了边界。另外一些数据，以“p”结尾，应当是polygon（多边形）的意思，这些数据描述了不同的区块。  
另外，每组数据都有3个文件，分别以“shp”，“dbf”，“shx”为扩展名。需要注意的是，虽然我们在作图时只用到了“shp”数据，但是显然这样的一组数据才是完整的数据。

**图片如下：**  
**国家基础地理信息系统<img src="https://s.w.org/images/core/emoji/13.0.1/72x72/2122.png" class="wp-smiley" alt="™" />版权所有**  
这是一个以bou1\_4l为基础的作图，可以看到南海的断续线。图内没有填充。  
<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2011/06/fig11.png" width="400" />  
这是一个以bou1\_4p为基础的作图，不可以看到南海的断续线。图内有填充。  
这显然是由于曲线没有面积造成的。  
<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2011/06/fig21.png" width="400" />

**参考资料：**  
MATLAB绘制中国地图
http://blog.sciencenet.cn/home.php?mod=space&uid=428536&do=blog&id=307997
