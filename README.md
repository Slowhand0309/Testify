# Recot

**R**uby **e**vidence **co**llect **t**ool<br>

Recot is a tool to gather evidence of the test.

[![Gem Version](https://badge.fury.io/rb/recot.svg)](https://badge.fury.io/rb/recot)
[![Build Status](https://travis-ci.org/Slowhand0309/recot.svg?branch=master)](https://travis-ci.org/Slowhand0309/recot)

## Description
Create evidence document for test to easy.<br>
Throw evidence(screen shots or file...) to specific folder for create evidence document.

## Install

Install the gem with:

```sh
gem install recot
```
## Usage

#### Recot command

```sh
$ rect <command>
```

|Command|Description|
|:------|:----------|
|start|Start recot to collect evidence.|
|export|Export to another format.|
|cleanup|Clean up cache.|
|destroy|Delete all file.|

If you want to export to another format, run the following command:

```sh
$ recot export
```
※ Yet now, `.xlsx` format only

If you want to delete cacche.
run the following command:

```sh
$ recot cleanup
```

If you want to delete all file and directory,
run the following command:

```sh
$ recot destroy
Sure you want to delete all the files? [y/N] > y
Removed all dependency files.
```

#### Start recot

To begin the test with the following command:

```sh
$ recot start
Start recot ver 0.2.2

    ____                  __
   / __ \___  _________  / /
  / /_/ / _ \/ ___/ __ \/ __/
 / _, _/  __/ /__/ /_/ / /
/_/ |_|\___/\___/\____/\__/
```

###### Options

`recot start` command has the following options:

|Option|Command|Description|Default|
|:-----|:------|:----------|:------|
|port|-p, --port|Set server port.|9292|
|open|-o, --open|Open top page by default browser.|nil|

###### Interactive command

Enter the test number as follows:

```sh
[1](recot) > A1
```

Directory corresponding to the test number is created under `__output/resources`.

```
├── __output
│   └── resources
│       ├── A1
```

It threw the evidence to the `basket` directory.

It will be reflected in the HTML automatically.

```
├── __output
│   ├── index.html
│   └── resources
│       ├── A1
│       │   ├── access.log
│       │   └── screenshot.png
│       └── A1.html
```

access the http://localhost:9292/__output/index.html

* index.html
![img001](http://slowhand0309.github.io/images/recot/index_html.png)

* resource.html
![img002](http://slowhand0309.github.io/images/recot/resource_html.png)

When you click the image to display the popup.
![img003](http://slowhand0309.github.io/images/recot/popup.png)

If you want to output the contents of the clipboard as a log, run the following command:

```sh
[2](recot) > paste <filename>
```

e.g.

※ State that has already been copied to the clipboard.
```sh
[1](recot) > A100
[2](recot) > paste copy.log
```
`copy.log` is output to the location of the `__output/resource/A100/`.

If you want to delete the previous evidence, run the following command:

```sh
[2](recot) > cancle
```

If you want to delete all the evidence of the particular test number, run the following command:

```sh
[3](recot) > clear
```

If you want to test the end, run the following command:

```sh
[4](recot) > exit
```


## Configuration

Can be configured in `config.yml` under the directory from which you started recot.

> Themes

You can select a theme from the following:

* white
![img002](http://slowhand0309.github.io/images/recot/resource_html.png)

* dark
![img004](http://slowhand0309.github.io/images/recot/theme_dark.png)
* light
![img005](http://slowhand0309.github.io/images/recot/theme_light.png)

* moon
![img006](http://slowhand0309.github.io/images/recot/theme_moon.png)

* sky
![img007](http://slowhand0309.github.io/images/recot/theme_sky.png)

Set the following in `config.yml`.
```yml
theme: "white"
```


> ProjectName

You can set a project name for evidecnce.

Set the following in 'config.yml'.
```yml
project_name: "Your project name"
```

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[slowhand0309](https://github.com/Slowhand0309)
