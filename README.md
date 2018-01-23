# RetroPie Configurator

[![Version][version-image]][version-url]
[![License][license-image]][license-url]

The **RetroPie Configurator** will configure a normal [RetroPie][retropie] installation to a standard Andrew Vaughan
has developed over several years.  It is intended to be a personal project, but is released under the MIT license for
anyone who wishes to use or fork it for their own use.

**This script can cause irreparable damage to both your RaspberryPi hardware and your RetroPie configuration.**  It is
entirely your responsibility to fully-understand what each section does before continuing.  **All** sections are
enabled by default.

For more information on liability and warranty limitations of this project, please refer to the
[Project License][license-url].

This project is in no way related to the RetroPie creators or organization.  It is intended for personal use only.

## Usage

A quick-install script is provided for your convenience.  This script can be run from the web from your RetroPie
device.  After [connecting to your RetroPie device over SSH][ssh-help] as the `pi` user, copy and paste this command
to get full help and usage instructions:

```bash
curl -Ls http://bit.do/retropieconfig | sudo bash -s -- --help
```
</small><em><sup>†</sup> Non-`pi` users are not currently supported, but are planned for a future release</em></small>

You will notice that the `--help` parameter is after the double-dashes (`--`) at the end.  All options listed in the
help, which match the options in the documentation below, must be placed in this location.

This command automatically downloads the latest tested version from the web each time you run it.  As the script is
updated when new configurations are discovered, this will ensure that you are always using the latest version of
RetroPie Configuration.

To run a full configuration, simply provide no parameters when running the script, like so:

```bash
curl -Ls http://bit.do/retropieconfig | sudo bash -s --
```

For a complex example, this will configure everything but the N64 settings in debug mode.  Refer to the
[script options](#scriptoptions) section for more information on what flags are available:

```bash
curl -Ls http://bit.do/retropieconfig | sudo bash -s -- -d --skip-n64-rice --skip-n64-glide --skip-n64-retrolink
```

***You should absolutely understand the repercussions of what this script will do before running these commands***

### Workflow

The script above, when run, will perform the following changes on the device.  For more details, please refer to the
[changelog][changelog]:

* **Dependency Installations**
  - First install may take some time; this should be significantly faster for subsequent runs
* **Sanity Checks**
  - Ensures that the device is a RaspberryPi 3
* **Operating System Configuration**
  - Updates and upgrades all operating system packages currently installed
  - Transitions the locale and keyboard settings to US UTF-8 instead of GB UTF-8
* **Overclocking**
  * *This expects you have both a fan and heatsinks on the RaspberryPi*
  * Adjusts a number of overclock settings to boost CPU, GPU and Memory speeds
  * Sets the CPU Governor to `performance` mode by default instead of `ondemand`
* **Emulator Optimization**
  - Optimizes the RetroArch Emulator (lr -cores)
  - Optimizes the Rice N64 Emulator
  - Optimizes the Glide N64 Emulator
* **Peripherals**
  - Fixes a common mapping issue with Retrolink N64 Controller mappings
* **Reboot**
  - In order for the system to properly apply changes, it must be rebooted; this is done by default for you

Each of these sections, plus some subsections, can be skipped using options described in the next section.

### Script Options

Several options exist to customize your experience.  Each of these options must be placed at the end of the command,
as described above.

#### Script Controls

The following options exist for your use that will impact how the script is run:

| Option    | Alternate     | Result                                                                  |
|:---------:|:-------------:|-------------------------------------------------------------------------|
| `-h`      | `--help`      | Prints usage instructions for the script                                |
|           | `--version`   | Prints the version of this script and exits                             |
| `-d`      | `--debug`     | Prints debug statements during script execution                         |
| `-v`      | `--verbose`   | Prints verbose debug statements during script execution                 |
| `-u USER` | `--user USER` | Sets the user that is running RetroPie *(default: pi)*                  |
| `-c`      | `--clean`     | Cleans packages installed during execution<sup>†<?sup> *(default: off)* |
|           | `--no-reboot` | Prevents rebooting when the script is completed                         |

#### Section Skipping

Additionally, a number of options are made available that allow you to skip any block of steps during the
configuration process.  These are listed in order of execution:

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

[changelog]:      https://github.com/andrewvaughan/retropie-configurator/blob/master/CHANGELOG.md

[ssh-help]:       https://github.com/RetroPie/RetroPie-Setup/wiki/ssh
[semver-url]:     http://semver.org/
[retropie]:       https://retropie.org.uk/
