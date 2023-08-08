---
title: Install sf (classInt)
author: gaoch
date: '2020-02-10'
slug: install-sf-classint
categories:
  - R
tags:
  - sf
---

在 Ubuntu 18.04 LTS 上面安装 R 包 `sf` 卡在了 `classInt` 上面。提示：


```
* installing *source* package ‘classInt’ ...
** package ‘classInt’ successfully unpacked and MD5 sums checked
** libs
gfortran   -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-AitvI6/r-base-3.4.4=. -fstack-protector-strong  -c fish1.f -o fish1.o
gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG      -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-AitvI6/r-base-3.4.4=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c init.c -o init.o
g++ -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o classInt.so fish1.o init.o -lgfortran -lm -lquadmath -L/usr/lib/R/lib -lR
/usr/bin/ld: cannot find -lgfortran
collect2: error: ld returned 1 exit status
/usr/share/R/share/make/shlib.mk:6: recipe for target 'classInt.so' failed
make: *** [classInt.so] Error 1
ERROR: compilation failed for package ‘classInt’
* removing ‘/usr/local/lib/R/site-library/classInt’

```

提示意思就是 `libgfortran.so` 不存在而造成的错误。

```
cd /usr/lib/x86_64-linux-gnu/
ln -s libgfortran.so.4 libgfortran.so
```


然后再试，安装成功。