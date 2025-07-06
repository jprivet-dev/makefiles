# Makefiles

## Presentation

Collection of useful makefiles and commands, with Docker, Symfony, PHP, Composer, Angular, Node, ...

## Installation

1. Clone the project:

```shell
git clone git@github.com:jprivet-dev/makefiles.git
cd makefiles
```

2. And choose one of the use cases. For example:

```shell
cd php-local-compose-v1-v2
make # print help
```

![php-docker-help.png](docs%2Fphp-docker-help.png)

## Cheat sheet

### Structure

```
# Comments are preceded by the hash symbol
.PHONY: target
target: dependencies
    command_1
    command_2
    ...
    command_n
```

## Technical choices

### `snack_case` vs `kebab-case`

I prefer to use the `snack_case` format for Makefile commands, as it's easier to select an entire command with a double-click (IDE, text editor, terminal, ...), unlike the `kebab-case` format.

✅ Double click to select with `snack_case` format:

```makefile
.PHONY: my_target_a
my_target_a: dependencies ## Description
    command
    command
```

❌ Double click to select with `kebab-case` format :

```makefile
.PHONY: my-target-a
my-target-a: dependencies ## Description
    command
    command
```

### `echo -e` vs `printf`

> See https://unix.stackexchange.com/questions/65803/why-is-printf-better-than-echo

To put it simply, I noticed that in the Makefiles, `echo -n` and `echo -e` did not behave identically, depending on the Linux distribution in which they were executed.

On **Ubuntu**, `echo -e ...` handles colours, without forcing `SHELL:=/bin/bash`, whereas on **Oracle Linux Server** it displays the colour encoding, for example `Part of \033[34mthe sentence in blue\033[0m, then reset.`

I now use `printf` exclusively...

## Resources

- https://github.com/dunglas/symfony-docker/blob/main/docs/makefile.md
- https://www.hpc2n.umu.se/documentation/compilers/makefiles
- https://stackoverflow.com/questions/2145590/what-is-the-purpose-of-phony-in-a-makefile
- https://devhints.io/makefile
- https://emojipedia.org/

## Comments, suggestions?

Feel free to make comments/suggestions to me in the [Git issues section](https://github.com/jprivet-dev/makefiles/issues).

## License

This project is released under the [**MIT License**](https://github.com/jprivet-dev/makefiles/blob/main/LICENSE).