# My kernel config for WSL2

target_version: linux-msft-wsl-5.10.60.1

- config-wsl: original
- my-config-wsl
    - enabled NUMA

# 1. Installation

## clone repository

```bash
$ git clone https://github.com/microsoft/WSL2-Linux-Kernel.git
$ cd WSL2-Linux-Kernel
$ git checkout ${target_version}
```

## build 

```bash
$ git clone https://github.com/ytakio/WSL2-Linux-Kernel-Config.git
$ cp WSL2-Linux-Kernel-Config/my-config-wsl ./.config
$ make -j16
```

## Install kernel

```bash
$ cp vmlinux ${kernel_dir}
```

And create `.wslconfig` and set path to use `vmlinux`

- .wslconfig (needed to be in escape sequence)

```bash
[wsl2]
kernel=D:\\wsl\\Ubuntu\\vmlinux
```

# Appendix.

## Configuration

```bash
$ cp Microsoft/config-wsl ./.config
$ make menuconfig
```

And enable following features.

- `CONFIG_NUMA`
```make
Symbol: NUMA [=y]
Type  : bool
Defined at arch/x86/Kconfig:1549
  Prompt: NUMA Memory Allocation and Scheduler Support
  Depends on: SMP [=y] && (X86_64 [=y] || X86_32 [=n] && HIGHMEM64G [=n] && X86_BIGSMP [=n])
  Location:
(1) -> Processor type and features
```
