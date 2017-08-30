# ansible-role-hadoop_journalnode

A brief description of the role goes here.

# Requirements

None

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `hadoop_journalnode_user` | `journalnode` user | `{{ __hadoop_journalnode_user }}` |
| `hadoop_journalnode_group` | `journalnode` group | `{{ __hadoop_journalnode_group }}` |
| `hadoop_journalnode_log_dir` | path to log directory | `/var/log/hadoop` |
| `hadoop_journalnode_service` | service name of `journalnode` | `journalnode` |
| `hadoop_journalnode_db_dir` | path to `dfs.journalnode.edits.dir` | `/var/db/journalnode` |
| `hadoop_conf_dir` | path to `dfs.journalnode.edits.dir` | `{{ __hadoop_conf_dir }}` |
| `hadoop_core_site_file` | path to `core-site.xml` | `{{ hadoop_conf_dir }}/core-site.xml` |
| `hadoop_hdfs_site_file` | path to `hdfs-site.xml` | `{{ hadoop_conf_dir }}/hdfs-site.xml` |
| `hadoop_mapred_site_file` | path to `mapred-site.xml` | `{{ hadoop_conf_dir }}/mapred-site.xml` |
| `hadoop_yarn_site_file` | path to `yarn-site.xml` | `{{ hadoop_conf_dir }}/yarn-site.xml` |
| `hadoop_config` | dict of config XML | `{}` |

# FreeBSD

| Variable | Default |
|----------|---------|
| `__hadoop_journalnode_user` | `hdfs` |
| `__hadoop_journalnode_group` | `hadoop` |
| `__hadoop_conf_dir` | `/usr/local/etc/hadoop` |

# Dependencies

None

# Example Playbook

```yaml
- hosts: localhost
  roles:
    - ansible-role-hadoop-journalnode
  pre_tasks:
    # XXX java.net.InetAddress.getLocalHost throws an exception without this
    - shell: echo "127.0.0.1 localhost {{ ansible_hostname }}" > /etc/hosts
      changed_when: False
    # XXX the latest haddop2, with "status" patches, is not available in the official repo
    - shell: mkdir -p /usr/local/etc/pkg/repos
      when: "{{ ansible_os_family == 'FreeBSD' }}"
      changed_when: false
    - shell: "echo 'FreeBSD: { enabled:  no }' > /usr/local/etc/pkg/repos/FreeBSD.conf"
      when: "{{ ansible_os_family == 'FreeBSD' }}"
      changed_when: false
    - shell: "echo 'reallyenglish: { url: \"pkg+http://10.3.build.reallyenglish.com/${ABI}\", mirror_type: \"srv\", signature_type: \"none\", enabled:  yes }' > /usr/local/etc/pkg/repos/reallyenglish.conf"
      when: "{{ ansible_os_family == 'FreeBSD' }}"
      changed_when: false
  vars:
    hadoop_config:
      core_site: []
      hdfs_site:
        -
          - name: dfs.nameservices
          - value: mycluster
        -
          - name: dfs.journalnode.edits.dir
          - value: "{{ hadoop_journalnode_db_dir }}"
      yarn_site: []
      mapred_site: []
```


# License

```
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
```

# Author Information

Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

This README was created by [ansible-role-init](https://gist.github.com/trombik/d01e280f02c78618429e334d8e4995c0)
