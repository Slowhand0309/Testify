# Recot

**R**uby **e**vidence **co**llect **t**ool<br>

Recot is a tool to gather evidence of the test.

## Description
Easy for us to create a test evidence of the document.<br>
Only the screen shots and log should you throw some in a specific folder.

## Install

Install the gem with:

```sh
gem install recot
```
## Usage

To begin the test with the following command:

```sh
recot start
Start recot ver 0.1.0

    ____                  __
   / __ \___  _________  / /
  / /_/ / _ \/ ___/ __ \/ __/
 / _, _/  __/ /__/ /_/ / /
/_/ |_|\___/\___/\____/\__/
```

Enter the test number as follows:

```sh
[1](recot) > 1-1-1
```

Directory corresponding to the test number is created under `__output`.

```
├── __output
│   ├── 1
│   │   └── 1
│   │       └── 1
```

It threw the evidence to the `basket` directory.

It will be reflected in the HTML automatically.

```
├── __output
│   ├── index.html
│   └── resources
```

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

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[slowhand0309](https://github.com/Slowhand0309)
