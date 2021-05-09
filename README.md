# packer-windows

Packer script for a Windows 10 VirtualBox based Vagrant box.

## Requirements

To build the box you will need a copy of the
[Windows 10 x64 Enterprise Trial](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise).

Once downloaded, change the packer/windows10-bare.json variable iso_path and iso_md5 to point to the
file and house its md5 checksum.

## Building on Linux

If building on Linux, some extra Ruby Gems are required in order to be able to use WinRM. Install
them with the following:

```bash
gem install winrm
gem install winrm-elevated
```

## License

[MIT](license.md) © 2021 [Brennan Fee](https://github.com/brennanfee)
