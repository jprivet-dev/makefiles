# Symfony env

## Overriding environment values via `.env.local`

> See https://symfony.com/doc/current/configuration.html#overriding-environment-values-via-env-local

| File                       | Behavior in Symfony                                                                                     | Committed |
|----------------------------|---------------------------------------------------------------------------------------------------------|-----------|
| .env                       | Defines the default values of the env vars needed by the application.                                   | YES       |
| .env.local                 | Overrides the default values **for all environments**, but only on the machine which contains the file. | NO        |
| .env.\<environment\>       | Overrides env vars **only for one environment**, but for all machines.                                  | YES       |
| .env.\<environment\>.local | Defines machine-specific env var overrides **only for one environment**. It's similar to `.env.local`.  | NO        |

> IMPORTANT: In Symfony, `.env.local` is ignored in the `test` environment (because tests should produce the same results for everyone).

## Using ignored `.env.local` & `.env.dev.local`

```shell
cp .env.local.dist .env.local
cp .env.dev.local.dist .env.dev.local
```

## Use case 1 (default)

| Local files      | Exists |
|------------------|--------|
| `.env.dev.local` | NO     |
| `.env.local`     | NO     |

```
$ make vars env_files 
APP_ENV   : dev
APP_SECRET: SECRET_DEV
Env files loaded into that Makefile (in order of decreasing priority) [FILE_ENV=dev]
* ⨯ .env.dev.local
* ✓ .env.dev
* ⨯ .env.local
* ✓ .env
```

## Use case 2 (default bis)

| Local files      | Exists |
|------------------|--------|
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
* ✓ .env.dev
* ✓ .env.local
* ✓ .env
```

## Use case 5 (force local dev env)

| Local files      | Exists |
|------------------|--------|
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
* ✓ .env.dev.local
* ✓ .env.dev
* ✓ .env.local
* ✓ .env
```

## Use case 3 (force prod env)

| Local files      | Exists |
|------------------|--------|
| `.env.dev.local` | NO     |
| `.env.local`     | YES    |

```dotenv
# .env.local
APP_ENV=prod
```

```
$ make vars env_files 
!!! CAUTION: your are in the PROD env !!!
APP_ENV   : prod
APP_SECRET: SECRET_PROD
Env files loaded into that Makefile (in order of decreasing priority) [FILE_ENV=prod]
* ⨯ .env.prod.local
* ✓ .env.prod
* ✓ .env.local
* ✓ .env
```

## Use case 4 (force test env)

| Local files      | Exists |
|------------------|--------|
| `.env.dev.local` | NO     |
| `.env.local`     | YES    |

```dotenv
# .env.local
APP_ENV=test
```

```
$ make vars env_files 
!!! CAUTION: your are in the TEST env !!!
APP_ENV   : test
APP_SECRET: SECRET_TEST
Env files loaded into that Makefile (in order of decreasing priority) [FILE_ENV=test]
* ⨯ .env.test.local
* ✓ .env.test
* ✓ .env.local
* ✓ .env
```