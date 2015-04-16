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

## Blog

<http://yutaf.github.io/i-made-a-deployment-tool-ryogoku/>

## How to use

* Move to the git repository to deploy
* Checkout the branch to deploy
* Create ryogoku.conf in the git repository root.  
It will be created by this command.

```
$ ryogoku init
```

* Fill in the ryogoku.conf and commit it

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
