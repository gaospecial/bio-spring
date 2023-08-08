---
title: matlab中如何删除矩阵的某一列元素
date: '2011-02-19'
slug: 2011-02-19-matlab-del-col
tags:
- 信息技术 INFORMATICS
- 转载 SHARE
- MATLAB
---


A为M行N列矩阵，删除第i列(1&lt;=i&lt;=N)，则：  
B=\[A(:,1:i-1),A(:,i+1:N)\];  
或直接在A上修改，  
A(:,i)=\[\];  
http://topic.csdn.net/u/20080725/17/b30c6b03-12c6-4022-9df9-de7fd5e0cb4c.html
