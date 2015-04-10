# ryogoku

Simple rsync deployment shell script

## Requirements

* git

## Installation

Clone this repository, and

```
$ make install
```

Set path to `/usr/local/bin` if you don't
```
$ echo 'export PATH=/usr/local/bin:$PATH' >> ~/.bashrc
```

## Update

```
$ ryogoku update
```

## blog

I wrote a blog post.  

<http://yutaf.github.io/i-made-a-deployment-tool-ryogoku/>

## How to use

* You need to be inside the git repository to deploy
* Create ryogoku.conf in git repository root
* Add `<env>` section to ryogoku.conf
* Checkout the branch to deploy

then

```
$ ryogoku <env> [ref]
```

## Usage

```
  Usage: ryogoku [options] <env> [command]

  default rsync option is "-rlpDvcK --delete"

  default rsync's "--exclude-from=" path is <REPOSITORY-ROOT>/rsync-exclude

  config file path is <REPOSITORY-ROOT>/ryogoku.conf

  Options:

    -V, --version        output program versions
    -h, --help           output help information
    -n, --dry-run        show what would have been transferred
    -P <n>               Set max number of parallel execution. default: 10

  Commands:

    init                 create config files
    update               update ryogoku to the latest release
    revert [n]           revert to [n]th last deployment or 1
    list                 list previous deploy commits
    setup_webhook_ssh    Add webhook public key to deployment host(s)'s authorized_keys
    [ref]                deploys indicated [ref].
```

## Configuration

Locate ryogoku.conf in the git repository root

```
[prod]
user rob
host 128.199.170.128 128.199.244.193
src build/
path /var/www/html
ref origin/master
pre-rsync ./bin/pre-rsync
post-deploy /var/www/html/bin/update.sh && /var/www/html/bin/update.prod.sh
umask 002

[stage]
host jimmy@128.199.170.128 jimmy@128.199.244.193
src build/
path /var/www/html
ref origin/develop
pre-rsync ./bin/pre-rsync
post-deploy /var/www/html/bin/update.sh && /var/www/html/bin/update.stage.sh
umask 002
```

## Directives

### user (optional), host

ssh user & host of deployment host or webhook.  
There's two way of setting.

1.

```
user deploy
host 128.199.170.128 128.199.244.193
```

In this case, you will deploy to deploy@128.199.170.128, deploy@128.199.244.193 hosts.

2.

```
host deploy@128.199.170.128 john@128.199.244.193
```

In this case, You don't need `user` directive.

### src (optional)

directory or file to be rsynced.  
In other words, rsync's `SRC`

### path

Deployment path.

```
path /var/www/html
```

### ref (optional)

When specified, indicated revision files are extracted.  
If specified in command line, command line's value precedes config one.  
Neither specified, it is set to `HEAD`.

### umask (optional)

Sets umask before extracting source files.  
If you use this directive, you should add same umask value to all envs in config.  
Or permissions are going to be random by each files.

### rsync-option (optional)

```
rsync-option -rlpDvcK
```

### rsync-exclude (optional)

This is the argument for rsync's `--exclude-from=`  
If this directive is not specified, ryogoku searches default path; `REPOSITORY-ROOT/rsync-exclude`

```
rsync-exclude .deploy/rsync-exclude
```

### pre-rsync (optional)

You can execute commands or scripts to the extracted files before rsync.  
The commands or scripts are executed at the directory root,  
which is relatively as same as the git repository root.  
You can use `&&` operator for multiple commands or scripts.

```
pre-rsync ./bin/pre-rsync
```

### post-deploy (optional)

executes commands or scripts to the deployment hosts after rsync.  
They are executed in indicated `path`.  
You can use `&&` operator for multiple commands or scripts.

```
post-deploy /var/www/myapp.com/update.sh && /var/www/myapp.com/update.master.sh
```

## Specific exit status

* `91` ... config section is not defined.

## License

The MIT License (MIT)

Copyright (c) 2014 Yuta Fujishiro

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
