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
1. Run the following command in dir which interactive_tail was installed.

```shell
$ rails server
```

2. Open http://localhost:3000/log_files.
3. Click 'New Log file', then Add observed file.
4. If you click 'Log' in global menu, you can show log tail.
5. If you click 'Logs grouped by tags' in global menu, you can show log tail grouped by tag.
 * A tag is recognized by [[foo]] mark in log contents.

Other
 * If you insert "(insert:/foo/bar.txt:tag1:val2)" into a observed log contents, then Interactive Tail insert 'tag1:' string at /foo/bar.txt replace to 'tag1:val2'.

License
----------
Copyright &copy; 2012 mathfur
Licensed under the [Apache License,   Version 2.0][Apache]
Distributed under the [MIT License][mit].
Dual licensed under the [MIT license][MIT] and [GPL license][GPL].
 
[Apache]: http://www.apache.org/licenses/LICENSE-2.0
[MIT]: http://www.opensource.org/licenses/mit-license.php

[GPL]: http://www.gnu.org/licenses/gpl.html
