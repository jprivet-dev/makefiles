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
cd php-docker
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

## Resources

- https://www.hpc2n.umu.se/documentation/compilers/makefiles
- https://stackoverflow.com/questions/2145590/what-is-the-purpose-of-phony-in-a-makefile
- https://emojipedia.org/

## Comments, suggestions?

Feel free to make comments/suggestions to me in the [Git issues section](https://github.com/jprivet-dev/makefiles/issues).

## License

This project is released under the [**MIT License**](https://github.com/jprivet-dev/makefiles/blob/main/LICENSE).