# Systemd and Journalctl Command Reference

systemd is a suite of system management daemons, libraries, and utilities designed to replace the traditional SysVinit system. It manages system services and resources, handling tasks like starting and stopping services, managing system states, and logging.

---

## Usage

To check if a service is running, use:


`systemctl is-active <service_name>`

To ensure that a service starts automatically at boot time:

`systemctl enable <service_name>`

Disabling Services

To prevent a service from starting automatically at boot time, use:

`systemctl disable <service_name>`

Stopping and Starting Services

To manually start or stop a service, you can use:

bash

`systemctl start <service_name>
systemctl stop <service_name>`
