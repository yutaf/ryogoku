# ryogoku

Simple rsync deployment shell script

## Forked from

<https://github.com/visionmedia/deploy>

## Features

- **Simple** ... minimal configurations and commands
- **Easy to start** ... don't need any installations on remote
- **Fast** ... preparing and building sources fast, and send them parallel

## Requirements

* git

## Installation

```
$ git clone git://github.com/yutaf/ryogoku.git
$ cd ryogoku
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

## Getting Started

<https://github.com/yutaf/ryogoku/wiki/Getting-Started>

## How it works

![How it works](/images/ryogoku-01.png)

## Usage

```
  Usage: ryogoku [options] <env> [command]

  * default rsync option is "-rlpDvcK --delete --safe-links"
  * default rsync's "--exclude-from=" path is REPOSITORY-ROOT/rsync-exclude
  * config file path is REPOSITORY-ROOT/ryogoku.conf

  Options:

    -V, --version               output program versions
    -h, --help                  output help information
    -n, --dry-run               show what would have been transferred
    -p, --path <path>           specify path value
    -P <n>                      Set max number of parallel execution. default: 10
    -c, --build-in-current-dir  build src in currnet directory, not in tmp cloned directory
    -d, --delete-dest           delete destination path post deployment

  Commands:

    init                        create config files
    update                      update ryogoku to the latest release
    envs                        list all env names
    list                        list previous deploy commits
    [ref]                       deploy indicated [ref]
    revert [n]                  revert to [n]th last deployment or 1
    config_get <directive>      print specified config value
    setup_remote_ssh <env>      Add remote env's public key to deployment host(s)'s authorized_keys
```

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
