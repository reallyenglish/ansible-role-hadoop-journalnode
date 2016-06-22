ansible-role-hadoop_journalnode
=====================

A brief description of the role goes here.

Requirements
------------

None

Role Variables
--------------

| Variable | Description | Default |
|----------|-------------|---------|
| hadoop\_journalnode\_user | journalnode user | {{ \_\_hadoop\_journalnode\_user }} |
| hadoop\_journalnode\_group | journalnode group | {{ \_\_hadoop\_journalnode\_group }} |
| hadoop\_journalnode\_log\_dir | log dir | /var/log/hadoop |
| hadoop\_journalnode\_service | service name | journalnode |
| hadoop\_journalnode\_db\_dir | dfs.journalnode.edits.dir | /var/db/journalnode |
| hadoop\_conf\_dir | path to xml configs | {{ \_\_hadoop\_conf\_dir }} |
| hadoop\_core\_site\_file | core-site.xml | {{ hadoop\_conf\_dir }}/core-site.xml |
| hadoop\_hdfs\_site\_file | hdfs-site.xml | {{ hadoop\_conf\_dir }}/hdfs-site.xml |
| hadoop\_mapred\_site\_file | mapred-site.xml | {{ hadoop\_conf\_dir }}/mapred-site.xml |
| hadoop\_yarn\_site\_file | yarn-site.xml | {{ hadoop\_conf\_dir }}/yarn-site.xml |
| hadoop\_config | a hash of config XML | {} |

FreeBSD
=======

| Variable | Default |
|----------|---------|
| \_\_hadoop\_journalnode\_user | hdfs |
| \_\_hadoop\_journalnode\_group | hadoop |
| \_\_hadoop\_conf\_dir | /usr/local/etc/hadoop |

Dependencies
------------

None

Example Playbook
----------------


License
-------

Copyright (c) 2016 Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

Author Information
------------------

Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

This README was created by [ansible-role-init](https://gist.github.com/trombik/d01e280f02c78618429e334d8e4995c0)
