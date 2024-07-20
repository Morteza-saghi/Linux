# Systemd and Systemctl Commands

## Checking Service Status
---
### Check if a Service is Running

`systemctl is-active sshd`

- Sample Output: active
---
Enable a Service to Start on Boot

`systemctl enable sshd`

Description: Enabling the SSH service with systemctl enable sshd ensures that the SSH daemon will automatically start on future boots, allowing remote SSH connections to your system.
---

Disable a Service

`systemctl disable sshd`

Description: Disabling the SSH service with systemctl disable sshd will prevent it from starting on future boots.
---
Systemd Configuration Directory

`Path: /etc/systemd/system/`
---
### Checking System Status
Determine Overall System Status

`systemctl is-system-running`


Description: This command is used to determine the overall status of a Linux system managed by systemd. It provides a summary of the system's state.

Possible Outputs

    running: The system is fully operational and all units are active or in their desired state.
    degraded: The system is operational, but some units are not functioning correctly.
    maintenance: The system is in maintenance mode.
    initializing: The system is still in the process of starting up.
    starting: The system is in the early stages of booting up.
    stopping: The system is in the process of shutting down.
    offline: The system is offline and systemd is not managing it actively.
    unknown: The system's state cannot be determined.
---
## Viewing Logs with Journalctl

### View Logs for a Specific Service

`journalctl -u <service_name>`

---
### View Logs Since the Last Boot

`journalctl -b`

---

### View Logs for a Specific Service Since the Last Boot


`journalctl -u <service_name> -b`

---

### View the Last 10 Lines of Logs

`journalctl -n 10`

---
### View Logs for a Specific User

`journalctl _UID=<user_id>`

---

### View Logs from the Last Day

`journalctl --since yesterday`

---

### View Logs for a Specific Service from the Last Day

`journalctl -u <service_name> --since yesterday`

---
### View Logs from the Last Day (Alternative Command)

`journalctl -S -1d`

---

- Note: -S is the short term for --since.

---
### View Logs from the Last 10 Minutes

`journalctl --since "10 minutes ago"`


---

## View Logs for a Specific Service from the Last Hour or Minutes
For viewing logs for the SSH service (sshd):

`journalctl -u sshd --since "1 hour ago"`

---

Commonly Used Command to See Recent Logs

`journalctl -xe`

### Description: This command is commonly used to see the most recent logs created.

Note: Ensure you replace <service_name> and <user_id> with the actual service name and user ID you are interested in.

Done. Good job!
