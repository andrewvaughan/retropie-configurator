# RetroPie Configurator

[![Version][version-image]][version-url]
[![License][license-image]][license-url]

This script will configure a standard [RetroPie][retropie] installation to performant settings as they are discovered.

This project is in no way related to the RetroPie creators or organization.  It is intended for personal use only.

> **This script can cause irreparable damage to both your RaspberryPi and RetroPie configuration.**  No warranty or
> liability is provided of any kind.  Please refer to the [project license][license-url] before continuing.

## Usage

To run this script, simply SSH into your RetroPie device and run the following command:

```bash
curl -s https://raw.githubusercontent.com/andrewvaughan/retropie-configurator/master/configurator | sudo bash -s --
```

You may be asked for a password, which will be the password for your user (`raspberry` for default `pi` users).

**Note** This script will reboot your device when it completes.  To prevent this, add the `--no-reboot` paramter
at the end of the command.

### Options

Several options exist to customize your experience.  Each of these options must be placed at the end of the command.
For instance, to print the usage instructions and help information for the script with the `-h` option, your entire
command would look like this:

```bash
curl -s https://raw.githubusercontent.com/andrewvaughan/retropie-configurator/master/configurator | sudo bash -s -- -h
```

The following options exist for your use:

| Option    | Alternate     | Result                                                                  |
|:---------:|:-------------:|-------------------------------------------------------------------------|
| `-h`      | `--help`      | Prints usage instructions for the script                                |
|           | `--version`   | Prints the version of this script and exits                             |
| `-d`      | `--debug`     | Prints debug statements during script execution                         |
| `-v`      | `--verbose`   | Prints verbose debug statements during script execution                 |
| `-u USER` | `--user USER` | Sets the user that is running RetroPie *(default: pi)*                  |
| `-c`      | `--clean`     | Cleans packages installed during execution<sup>†<?sup> *(default: off)* |
|           | `--no-reboot` | Prevents rebooting when the script is completed                         |

Additionally, a number of options are made available that allow you to skip any step of the configuration process:

| Option                       | Result                                                              |
|-----------------------------:|---------------------------------------------------------------------|
| `--skip-compatibility-check` | Skips the device compatibility check at the beginning of the script |
| `--skip-overclocking`        | Skips setting the overclock settings on the RaspberryPi             |
| `--skip-cpu-governor`        | Skips setting the CPU governor on the RaspberryPi                   |
| `--skip-os-packages`         | Skips updating and upgrading Raspbian distribution packages         |
| `--skip-locales`             | Skips setting the locales and keyboard to US UTF-8                  |
| `--skip-retroarch`           | Skips optimizing RetroArch emulators                                |
| `--skip-n64-rice`            | Skips optimizing the Rice N64 emulator                              |
| `--skip-n64-glide`           | Skips optimizing the Glide N64 emulator                             |
| `--skip-n64-retrolink`       | Skips configuring Retrolink N64 controllers                         |

## Release Policy

Releases of Redshift follow [Semantic Versioning][semver-url] standards in a `MAJOR.MINOR.PATCH` versioning
scheme of the following format:

* `MAJOR` - modified when major, incompatible changes are made to the application,
* `MINOR` - modified when functionality is added in a backwards-compatible manner, and
* `PATCH` - patches to existing functionality, such as documentation and bug fixes.

## License

This project is licensed via the [MIT License][license-url]:

```
MIT License

Copyright (c) 2018 Andrew Vaughan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```


[version-image]:  http://img.shields.io/badge/release-0.1.0-blue.svg?style=flat
[version-url]:    https://github.com/andrewvaughan/retropie-configurator/releases
[license-image]:  http://img.shields.io/badge/license-MIT-blue.svg?style=flat
[license-url]:    https://github.com/andrewvaughan/retropie-configurator/blob/master/LICENSE

[semver-url]:     http://semver.org/
[retropie]:       https://retropie.org.uk/
