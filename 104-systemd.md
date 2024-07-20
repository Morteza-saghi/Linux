# Systemd and Journalctl Command Reference

systemd is a suite of system management daemons, libraries, and utilities designed to replace the traditional SysVinit system. It manages system services and resources, handling tasks like starting and stopping services, managing system states, and logging.

---

## Usage

To check if a service is running, use:


`systemctl is-active <service_name>`

To make sure that the SSH service starts automatically each time your system boots:


`systemctl enable <service_name>`
