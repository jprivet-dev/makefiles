# Symfony env include

## Overriding environment values via `.env.local`

> See https://symfony.com/doc/current/configuration.html#overriding-environment-values-via-env-local

| File                       | Behavior in Symfony                                                                                     | Committed |
|----------------------------|---------------------------------------------------------------------------------------------------------|-----------|
| .env                       | Defines the default values of the env vars needed by the application.                                   | YES       |
| .env.local                 | Overrides the default values **for all environments**, but only on the machine which contains the file. | NO        |
| .env.\<environment\>       | Overrides env vars **only for one environment**, but for all machines.                                  | YES       |
| .env.\<environment\>.local | Defines machine-specific env var overrides **only for one environment**. It's similar to `.env.local`.  | NO        |

> IMPORTANT: In Symfony, `.env.local` is ignored in the `test` environment (because tests should produce the same results for everyone).

## Using env ignored files

```shell
cp .env.local.php.dist .env.local.php
cp .env.dev.local.dist .env.dev.local
cp .env.local.dist .env.local
```

## Use cases

### 1. Default

| Local files      | Exists |
|------------------|--------|
| `.env.local.php` | NO     |
| `.env.local`     | NO     |
| `.env.local`     | NO     |

```
$ make vars env_files 
APP_ENV   : dev
APP_SECRET: SECRET_DEV
Env files loaded into that Makefile (in order of decreasing priority) [FILE_ENV=dev]
* ⨯ .env.dev.local
* ✔ .env.dev
* ⨯ .env.local
* ✔ .env
```

### 2. Default bis

| Local files      | Exists |
|------------------|--------|
| `.env.local.php` | NO     |
| `.env.dev.local` | NO     |
| `.env.local`     | YES    |

```dotenv
# .env.local
#APP_ENV=prod
```

```
$ make vars env_files 
APP_ENV   : dev
APP_SECRET: SECRET_DEV
Env files loaded into that Makefile (in order of decreasing priority) [FILE_ENV=dev]
* ⨯ .env.dev.local
* ✔ .env.dev
* ✔ .env.local
* ✔ .env
```

### 3. Force local dev env

| Local files      | Exists |
|------------------|--------|
| `.env.local.php` | NO     |
| `.env.dev.local` | YES    |
| `.env.local`     | YES    |

```dotenv
# .env.dev.local
APP_SECRET=SECRET_DEV_LOCAL
```

```dotenv
# .env.local
#APP_ENV=prod
```

```
$ make vars env_files 
APP_ENV   : dev
APP_SECRET: SECRET_DEV_LOCAL
Env files loaded into that Makefile (in order of decreasing priority) [FILE_ENV=dev]
* ✔ .env.dev.local
* ✔ .env.dev
* ✔ .env.local
* ✔ .env
```

### 4. Force prod env

| Local files      | Exists |
|------------------|--------|
| `.env.local.php` | NO     |
| `.env.dev.local` | NO     |
| `.env.local`     | YES    |

```dotenv
# .env.local
APP_ENV=prod
```

```
$ make vars env_files 
Warning: Your are in the prod environment!
APP_ENV   : prod
APP_SECRET: SECRET_PROD
Env files loaded into that Makefile (in order of decreasing priority) [FILE_ENV=prod]
* ⨯ .env.prod.local
* ✔ .env.prod
* ✔ .env.local
* ✔ .env
```

### 5. Force test env

| Local files      | Exists |
|------------------|--------|
| `.env.local.php` | NO     |
| `.env.dev.local` | NO     |
| `.env.local`     | YES    |

```dotenv
# .env.local
APP_ENV=test
```

```
$ make vars env_files 
Warning: Your are in the test environment!
APP_ENV   : test
APP_SECRET: SECRET_TEST
Env files loaded into that Makefile (in order of decreasing priority) [FILE_ENV=test]
* ⨯ .env.test.local
* ✔ .env.test
* ✔ .env.local
* ✔ .env
```

### 6. Only `.env` exists

| Local files      | Exists |
|------------------|--------|
| `.env.local.php` | NO     |
| `.env.dev.local` | NO     |
| `.env.local`     | NO     |

```
$ make vars env_files 
APP_ENV   : dev
APP_SECRET: SECRET_DEFAULT
Env files loaded into that Makefile (in order of decreasing priority) [FILE_ENV=dev]
* ⨯ .env.dev.local
* ⨯ .env.dev
* ⨯ .env.local
* ✔ .env
```

### 7. `.env.local.php` exists

| Local files      | Exists |
|------------------|--------|
| `.env.local.php` | YES    |
| `.env.dev.local` | NO     |
| `.env.local`     | NO     |

```
$ make vars env_files 
Warning: It is not possible to use variables from .env.local.php file!
Warning: The final APP_ENV of that Makefile may be different from the APP_ENV of .env.local.php!
APP_ENV   : dev
APP_SECRET: SECRET_DEV
Env files loaded into that Makefile (in order of decreasing priority) [FILE_ENV=dev]
* ⨯ .env.dev.local
* ✔ .env.dev
* ⨯ .env.local
* ✔ .env
```