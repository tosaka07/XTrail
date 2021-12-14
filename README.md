# XTrail

A command line tool to easily install and browse Xcode templates.

## Usage

The general invocation syntax for xtrail is as follows:

```sh
xtrail <subcommand>
```

### Install a template

```
xtrail install <template-directory> [--type <type>] [--name <name>] [--verbose]
```

To install the Xcode Template, use the `install` command.  You can also generate a symbolic link by specifying **link** for `type`. By default, the directory specified in the argument will be installed as is, you can use `name` to save it as an alias.

### Uninstall a template

```
xtrail uninstall <name> [--verbose]
```

Use the `uninstall` command to remove the template from the template directory.  The `name` is the name of the template folder. You can check it with the `list` command.

### List

```
xtrail list
```

### List

## Installation

### Homebrew

```sh
brew install tosaka07/tap/xtrail
```

### Mint

```sh
mint install tosaka07/XTrail
```

### Manual

```sh
git clone https://github.com/tosaka07/XTrail.git
make install
```

#### Shell Completion

You can install shell completion scripts.
For more information, [here](https://github.com/apple/swift-argument-parser/blob/main/Sources/ArgumentParser/Documentation.docc/Articles/InstallingCompletionScripts.md).

```
xtrail --generate-completion-script bash
```

## Development

**open project with Xcode**

```sh
open -a Xcode.app .
```

**Local build**

```
$ make build-debug
$ ./build/debug/xtrail ...
```

**Release build**

```sh
$ make build
```

## License

MIT
