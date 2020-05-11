# Hetzner-kube dockerized
![Build status](https://github.com/vmiko/hetzner-kube/workflows/Continuous%20integration/badge.svg?event=push)

A lightweight and easy way to use [Hetzner-kube](https://github.com/xetys/hetzner-kube) in a docker context.

## Details
[![](https://images.microbadger.com/badges/image/vmiko/hetzner-kube.svg)](https://microbadger.com/images/vmiko/hetzner-kube "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/vmiko/hetzner-kube.svg)](https://microbadger.com/images/vmiko/hetzner-kube "Get your own version badge on microbadger.com")

## How to Build ?
### Requirements
We use [act](https://github.com/nektos/act) as a local task runner.

### Build
```console
act -P ubuntu-latest=nektos/act-environments-ubuntu:18.04 -j build-push
```

## How to Run ?
```console
docker run --rm vmiko/hetzner-kube:latest help
```
