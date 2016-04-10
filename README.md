# Recot

**R**uby **e**vidence **co**llect **t**ool<br>

Recot is a tool to gather evidence of the test.

## Description
Create evidence document for test to easy.<br>
Throw evidence(screen shots or file...) to specific folder for create evidence document.

## Install

Install the gem with:

```sh
gem install recot
```
## Usage

To begin the test with the following command:

```sh
$ recot start
Start recot ver 0.1.0

    ____                  __
   / __ \___  _________  / /
  / /_/ / _ \/ ___/ __ \/ __/
 / _, _/  __/ /__/ /_/ / /
/_/ |_|\___/\___/\____/\__/
```

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

access the 'http://localhost:9292/__output/index.html'

* index.html
![img001](http://slowhand0309.github.io/images/recot/index_html.png)

* resource.html
![img002](http://slowhand0309.github.io/images/recot/resource_html.png)

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

If you want to delete all file and directory,
run the following command:

```sh
[5](recot) > destroy
```

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[slowhand0309](https://github.com/Slowhand0309)
