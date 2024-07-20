# Systemd and Journalctl Command Reference

systemd is a suite of system management daemons, libraries, and utilities designed to replace the traditional SysVinit system. It manages system services and resources, handling tasks like starting and stopping services, managing system states, and logging.

---

## Usage

To check if a service is running, use:

```bash
systemctl is-active <service_name>

To make sure that the SSH service starts automatically each time your system boots:

```bash
systemctl enable <service_name>

we also can :

```bash
systemctl disable <service_name>
to do the opposite

Systemd Configuration and Status Check
Systemd Configuration Directory

### Systemd configurations are located in the following directory:

`/etc/systemd/system/`

This directory contains the unit files and configuration settings used by systemd to manage system services and other system states.
Checking System Status with systemctl is-system-running

The systemctl is-system-running command is used to determine the overall status of a Linux system managed by systemd. When executed, this command provides a summary of the system's current state.
Possible Outputs

    running: The system is fully operational, and all units are active or in their desired state.
    degraded: The system is operational, but some units are not functioning correctly. This indicates that one or more system services have failed or are not running as expected.
    maintenance: The system is in maintenance mode. This could be due to the system being booted into rescue or emergency mode, or manually set to maintenance mode.
    initializing: The system is still in the process of starting up.
    starting: The system is in the early stages of booting up.
    stopping: The system is in the process of shutting down.
    offline: The system is offline, and systemd is not managing it actively.
    unknown: The system's state cannot be determined.


