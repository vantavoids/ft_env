# ft_env

A Docker based solution to emulate 42 Paris' working environment

## Disclaimer
This obviously isn't a 1:1 copy! Always ensure to test your projects directly on the school dumps to avoid bad surprises during evaluations :p (saves you from the "it works on my machine" hassle)

## Building

```sh
docker build -t ft_env .
```

## Usage

```sh
docker run -it -v $(pwd):/workspace ft_env
```

## Usage (the smarter way)

Make yourself an alias (either in `~/.zshrc` or `~/.bashrc`)
```sh
alias ft_env='docker run -it -v $(pwd):/workspace ft_env'
```