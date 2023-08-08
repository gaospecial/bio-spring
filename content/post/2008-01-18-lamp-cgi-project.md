---
title: "LAMP Project[part B]-解析cgi动态网页项目源代码(下部)"
date: "2008-01-18"
author: gaoch
tags:
  - 百度空间
---

这里是该项目的完整代码,在本机上运行正确,
如果出错,就是你LAMP的配置有问题. 文中注释即为相关解释.  
整整一百行哦...哈哈![](http://img.baidu.com/hi/face/i_f28.gif)  
  
1 \#! /usr/bin/perl  
2 \# if.simple.cgi  
3 use DBI;  
4 use CGI ':standard';  
5  
6 \#\#\#\#  
7 \# handle\_error() - 错误处理的一个子程序  
8 \#\#\#\#  
9 **sub** handle\_error {  
10 **my** $msg = **shift** ||' ';  
11 **my** $dbh = **shift** ||' ';  
12 **my** $sth = **shift** ||' ';  
13 \#text/html行下必须有一个空行  
14 **print** &lt;&lt;EOHTML;  
15 Content-type: text/html  
16  
17 &lt;head&gt;  
18 &lt;title&gt;Age Information Error&lt;/title&gt;  
19 &lt;/head&gt;  
20 &lt;body bgcolor="\#ffffff"&gt;  
21 There was an error: &lt;b&gt;$msg&lt;/b&gt;  
22 &lt;/body&gt;  
23 &lt;/html&gt;  
24 EOHTML  
25 \#EOHTML行只能有这几个字母, 一个不多,一个不少.  
26  
27 \# finish the state handle and disconnect, if necessary  
28 $sth-&gt;finish() **if** $sth;  
29 $dbh-&gt;disconnect() **if** $dbh;  
30 **exit** 0;  
31 }  
32  
33 \#\#\#\#  
34 \# 程序主体在这里  
35 \#\#\#\#  
36  
37 \# 连接数据库服务器  
38 **my** $dbh = DBI-&gt;**connect**('DBI:mysql:test', 'apache',
'lampiscool')  
39 **or** handle\_error("Can't connect..." . DBI-&gt;errstr());  
40  
41 \# 现在开始创建网页, 首先创建网页的头文件, 一个表格的头部  
42 **print** header(),  
43 start\_html(-title=&gt;"Project with MySQL, Perl",  
44 -bgcolor =&gt; '\#ffffff'),  
45 &lt;&lt;EOHTML;  
46 &lt;h2&gt;Your queryed impact factor&lt;/h2&gt;  
47 &lt;table border="1" bgcolor=yellow&gt;  
48 &lt;tr
bgcolor=orange&gt;&lt;th&gt;Title&lt;/th&gt;&lt;th&gt;IF04&lt;/th&gt;&lt;th&gt;IF05&lt;/th&gt;&lt;th&gt;IF06&lt;/th&gt;&lt;/tr&gt;  
49 EOHTML  
50 \# 上面的这一行, 只能有这几个字符, 连一个空格都不能多,
否则会出现服务器内部错误  
51 \# 这个table还没有结束, 下面会继续由程序创建table项目.  
52  
53 \# 对返回的参数进行处理  
54 **if** (param()) {  
55 \# 获取查询字符串.  
56 \# inputbox的name为query, 把它返回的参数保存到$query中去  
57 **my** $query = param('query') ||' ';  
58 \# 查询数据库  
59 **my** $sth = $dbh-&gt;prepare('SELECT title,if04,if05,if06 FROM
ifactor  
60 WHERE title RLIKE ? ')  
61 **or** handle\_error("Can't prepare SQL: " . $dbh-&gt;errstr(),
$dbh);  
62  
63 $sth-&gt;execute($query)  
64 **or** handle\_error("Can't execute SQL: " . $dbh-&gt;errstr(),  
65 $dbh, $sth);  
66 **my**($title,$if04,$if05,$if06);  
67 \# 这里就是表格table的中间部分  
68 **while** (($title,$if04,$if05,$if06) = $sth-&gt;fetchrow()) {  
69 **print**
"&lt;tr&gt;&lt;th&gt;$title&lt;/th&gt;&lt;th&gt;$if04&lt;/th&gt;&lt;th&gt;$if05&lt;/th&gt;&lt;th&gt;$if06&lt;/th&gt;&lt;/tr&gt;\\n";  
70 }  
71  
72 }  
73  
74 \# 这里结束table的html代码, 于是有了一个完整的table.  
75 \# 此处设置了返回数据的方法(get), 返回的目标(if.simple.cgi),  
76 \# 一个文本框和两个按钮.  
77 **print** &lt;&lt;EOHTML;  
78 &lt;/table&gt;  
79 &lt;hr&gt;  
80 &lt;h2&gt;Enter query&lt;/h2&gt;  
81 You can enter you query below. &lt;b&gt;e.g:&lt;/b&gt; annu rev, p.\*
n.\* a.\* s,etc  
82 &lt;form action="/mycgi/if.simple.cgi" method="get"&gt;  
83 &lt;table border="0" bgcolor=orange&gt;  
84 &lt;tr&gt;  
85 &lt;td&gt;Query name:&lt;/td&gt;  
86 &lt;td&gt;&lt;input type="text" name="query" maxsize="20"
value=""&gt;&lt;/td&gt;  
87 &lt;/tr&gt;  
88 &lt;tr&gt;  
89 &lt;td&gt;&lt;input type="submit" value="Submit
Data"&gt;&lt;/td&gt;  
90 &lt;td&gt;&lt;input type="reset" value="Reset Form"&gt;&lt;/td&gt;  
91 &lt;/tr&gt;  
92 &lt;/table&gt;  
93 &lt;/form&gt;  
94 EOHTML  
95  
96 \# 这一行代码标志这cgi网页的完成  
97 **print** end\_html();  
98 \# 关闭数据库连接  
99 $sth-&gt;finish();  
100 $dbh-&gt;disconnect();  
  
参考资料: **Open Source Web Development with LAMP (**ISBN:
0-201-77061-X)
