# User logged on monitoring

This repository provides information on several useful terminal commands for monitoring user activity and system processes in a Unix-like environment. Below you'll find details on the `last` and `w` commands, as well as an explanation of TTY and PTS.

## `last` Command

The `last` command displays a list of the most recent logins and logouts. It is useful for tracking user activity and diagnosing potential security issues.

### Output Fields:

- **TTY:** Terminal type.
- **FROM:** Hostname or IP address from where the user logged in.
- **LOGIN@: **Time when the user logged in.
- **LOGOUT:** Time when the user logged out.
- **DURATION:** Duration of the session.

## `w` Command

The `w` command shows information about the users currently logged into the machine and their processes. It is useful for system administrators to monitor user activity and system load.

### Output Fields:

- **TTY:** Terminal type.
- **FROM:** Hostname or IP address from where the user is logged in.
- **LOGIN@: **Time when the user logged in.
- **IDLE:** Duration of inactivity since the user last interacted with their terminal session.
- **JCPU:** Time used by all processes attached to the terminal.
- **PCPU:** Time used by the current process.
- **WHAT:** Command being executed.

---

#### The last command reads from the 

```
nano /var/log/wtmp
```

also related directories

```
/var/run/utmp
```

---

## Viewing Processes in a TTY

To see the processes inside of a specific TTY, you can use the following command:

```bash
ps -t pts/2
