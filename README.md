Interactive tail
================

This tool show log files to browser.

 
Install
------
```shell
$ git clone https://github.com/mathfur/interactive_tail.git
$ cd interactive_tail
$ bundle install
```

Usage
-----
```shell
$ rails server
```
* You can add observed log file to http://localhost:3000/log_files.
* You can show log files at http://localhost:3000/logs or http://localhost:3000/logs/index_grouped_by_tags.
* If contents of log contain "(insert:/foo/bar.txt:tag1:val2)", then 'tag1:' string at /foo/bar.txt replace to 'tag1:val2'.

License
----------
Copyright &copy; 2012 mathfur
Licensed under the [Apache License,   Version 2.0][Apache]
Distributed under the [MIT License][mit].
Dual licensed under the [MIT license][MIT] and [GPL license][GPL].
 
[Apache]: http://www.apache.org/licenses/LICENSE-2.0
[MIT]: http://www.opensource.org/licenses/mit-license.php

[GPL]: http://www.gnu.org/licenses/gpl.html
