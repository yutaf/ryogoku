# ryogoku

Simple rsync deployment shell script

## Forked from

<https://github.com/visionmedia/deploy>

## Features

- Rsync
- Multi host deployment
- Parallel execution

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

## Sample

1. Create a config file

  ```
  [prod]
  user rob
  host 128.199.170.128 128.199.244.193
  src build/
  path /var/www/html
  ref master
  pre-rsync ./bin/pre-rsync
  post-deploy /var/www/html/bin/update.sh && /var/www/html/bin/update.prod.sh
  umask 002
  ```

2. Deploy

  ```
  $ ryogoku prod
  ```

## Getting Started

<https://github.com/yutaf/ryogoku/wiki/Getting-Started>

## Blog

<http://yutaf.github.io/i-made-a-deployment-tool-ryogoku/>

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
