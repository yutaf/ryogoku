## 1.2.3 / 2020-09-24

  * Add --no-git option

## 1.2.2 / 2016-07-26

  * Fix port setting bug

## 1.2.1 / 2016-05-25

  * Override executed ryogoku file itself when it is updated

## 1.2.0 / 2016-05-24

  * Add --pre-deploy, --pre-rsync, --post-deploy to cli options
  * Remove --build-in-current-dir option
  * Fix setting check

## 1.1.7 / 2016-05-20

  * Add 'info' subcommand

## 1.1.6 / 2016-05-19

  * Rename 'enable_ssh' -> 'allow_ssh'
  * Fix enable_ssh(allow_ssh) command

## 1.1.5 / 2016-05-12

  * Escape double quotes in deploy log

## 1.1.4 / 2016-04-21

  * Stop parallel execution in enable_ssh command
  * Create path in pre_deploy hook if it does not exist

## 1.1.3 / 2016-03-28

  * Fix ssh connection hang

## 1.1.2 / 2015-11-11

  * Add 'config_get' command

## 1.1.1 / 2015-09-04

  * Fix option names
  * Refactorings

## 1.1.0 / 2015-09-04

  * Enable specifying ssh key in config file
  * Print usage when no arguments are passed
  * Refactorings

## 1.0.0 / 2015-09-03

  * Improve tmp directory name to be unique

## 0.7.0 / 2015-07-02

  * Add 'pre-deploy' directive

## 0.6.3 / 2015-06-09

  * Add '--current' option
  * Add '--discard' option
  * Add 'config_get' command

## 0.6.2 / 2015-06-08

  * Add '-p, --path' option

## 0.6.1 / 2015-06-08

  * Add 'execute_in_current_dir' directive

## 0.6.0 / 2015-05-27

  * Check ssh connection on dry mode

## 0.5.9 / 2015-05-25

  * Update 'setup_webhook_ssh' to 'setup_remote_ssh'

## 0.5.8 / 2015-05-25

  * Add 'ssh_command_single'

## 0.5.7 / 2015-05-24

  * Add 'ssh_command'

## 0.5.6 / 2015-05-21

  * Reject invalid ref
