# Testify
Testify is a tool to gather evidence of the test.

## Description
Easy for us to create a test evidence of the document.<br>
Only the screen shots and log should you throw some in a particular folder.

## Install

Install the gem with:

```sh
gem install testify
```
## Usage

Set a specific folder to be synchronized and project name to the first `config.yml`.

```yaml
project: 'test_project'
sync_folder: '/tmp/test_project'
```

To begin the test with the following command:

```sh
testify start
```

Enter the test number as follows:

```sh
[1](testify) > 1-1-1
```

It threw the evidence to a specific directory.

It will be reflected in the HTML automatically.

```
TODO
```

If you want to delete the previous evidence, run the following command:

```sh
[2](testify) > cancle
```

If you want to delete all the evidence of the particular test number, run the following command:

```sh
[2](testify) > clear 1-1-1
```

If you want to test the end, run the following command:

```sh
[3](testify) > finish
```

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[slowhand0309](https://github.com/Slowhand0309)
