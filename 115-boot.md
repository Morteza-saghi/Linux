## Booting and GRUB in Linux
Booting is the process of starting up a computer and loading the operating system. GRUB (GRand Unified Bootloader) is a bootloader package that supports multiple operating systems on a computer.
Booting Process

- BIOS/UEFI Initialization: When the computer is powered on, the BIOS/UEFI firmware initializes the hardware.
- MBR/GPT Loading: The firmware loads the Master Boot Record (MBR) or GUID Partition Table (GPT) from the storage device.
- Bootloader Execution: The MBR/GPT loads the bootloader (like GRUB) into memory and transfers control to it.
- Kernel Loading: The bootloader loads the Linux kernel into memory.
- Init System: The kernel initializes the system and starts the init system (like systemd or init).

### GRUB (GRand Unified Bootloader)
GRUB is a popular bootloader used in many Linux distributions. It can load different operating systems and manage the boot process.
GRUB Configuration Files


```
        GRUB 2 (the most commonly used version) configuration files are usually located in:
        Main Configuration File: /etc/default/grub
        Custom Menu Entries: /etc/grub.d/
        Generated GRUB Configuration: /boot/grub/grub.cfg
```

---

#### Editing GRUB Configuration

Main Configuration File (This file contains the primary settings for GRUB)

```
nano /etc/default/grub
```
        
Example content:

```
GRUB_TIMEOUT=5
GRUB_DEFAULT=0
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX=""
```

---

## GRUB Commands and Their Usage
Here are some key GRUB commands along with their usage scenarios:


---

```
update-grub
```

This command is used to regenerate the GRUB configuration file (grub.cfg). It scans for installed operating systems and updates the boot menu accordingly.

Scenario: After making changes to /etc/default/grub or scripts in /etc/grub.d/, you need to apply these changes to the GRUB configuration.

---

```
grub-install
```

Usage: This command installs GRUB onto a specified device, typically the Master Boot Record (MBR) or the EFI System Partition (ESP).

Scenario: When setting up GRUB for the first time or after recovering from a system crash that affects the bootloader, you may need to reinstall GRUB.

sudo grub-install /dev/sda


---
```
grub-mkconfig
```

Usage: Generates a new GRUB configuration file (grub.cfg) based on the configuration in /etc/default/grub and the scripts in /etc/grub.d/.

Scenario: Similar to update-grub, but more explicitly used in some distributions or scripts to generate the GRUB configuration.

Like:
```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```


---
```
grub-set-default
```

Usage: Sets the default boot entry to be loaded by GRUB.

Scenario: You want to set a specific menu entry as the default boot option, especially useful in dual-boot scenarios.

Like:

```
sudo grub-set-default 1
```
Or using the entry name:
```
sudo grub-set-default 'Ubuntu, with Linux 5.4.0-42-generic'
```

---
```
grub-reboot
```

Usage: Sets the default boot entry for the next boot only. The subsequent boots will use the default set by grub-set-default.

Scenario: You want to temporarily boot into a different operating system or kernel version for the next reboot only.

```
sudo grub-reboot 1
```

Or using the entry name:

```
sudo grub-reboot 'Windows 10 (on /dev/sda1)'
```

---

```
grub-editenv
```

Usage: Manipulates the GRUB environment block. Useful for setting and querying saved entries.

Scenario: You want to check or modify the saved GRUB environment variables.

Check environment variables:

```
sudo grub-editenv list
```

Set environment variable:

```
sudo grub-editenv set next_entry=2
```
---

```
grub-mkpasswd-pbkdf2
```

Usage: Generates an encrypted password for use with GRUB.

Scenario: Securing GRUB with a password to restrict access to the boot menu and editing boot parameters.

```
sudo grub-mkpasswd-pbkdf2
```
---

```
grub-probe
```

Usage: Probes a device or filesystem to determine the filesystem type or other properties.

Scenario: Checking the filesystem type of a partition to ensure GRUB compatibility.

```
sudo grub-probe --target=fs /boot
```

---

```
grub-rescue
```

Usage: This is not a command but a mode GRUB enters when it cannot find its configuration file or is corrupted.

Scenario: Troubleshooting and recovering a broken GRUB configuration.

---

Done
