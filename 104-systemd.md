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
