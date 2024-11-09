# Creating and Managing `systemd` Unit Files

## Unit File Structure

`systemd` unit files are typically located in `/etc/systemd/system/` (for system-wide services) or in `~/.config/systemd/user/` (for user-specific services). The unit file should follow this structure:

```
[Unit]
Description=Your Service Description Here
After=network.target

[Service]
Type=simple
ExecStart=/path/to/your/executable --arguments
ExecReload=/bin/kill -HUP $MAINPID
ExecStop=/bin/kill -TERM $MAINPID
Restart=on-failure
RestartSec=10s
User=your-username
Group=your-group

[Install]
WantedBy=multi-user.target
Section Breakdown
```

---


### 1.[Unit]

Description: A brief description of the service.
After: Defines the order for starting services; this service starts after network.target.


### 2.[Service]

Type: Defines the process type, determining how systemd should expect the service process to behave.
ExecStart: The command to start the service.
ExecReload: The command to reload the service (optional).
ExecStop: The command to stop the service (optional).
Restart: Defines restart behavior (on-failure, always, no).
RestartSec: Time to wait before a restart attempt.
User and Group: Specify which user and group will run the service.


### 3.[Install]

WantedBy: Specifies targets under which this service will be enabled. Common options include multi-user.target and graphical.target.
[Service] Type Directive
The Type directive tells systemd how it should expect the service process to behave. Here are the primary Type values:



### 4.Type=simple (default)
Description: This is the default type. systemd considers the service to be running as soon as the ExecStart command begins. systemd does not expect the service to fork a new process or run in the background.

Usage: Good for services that don’t daemonize (run as background processes), such as scripts that remain in the foreground until they’re killed.

#### Example:

```
[Service]
Type=simple
ExecStart=/usr/bin/python3 -m http.server
Type=forking
Description: Used when the service process forks (spawns a child process) and the parent process exits quickly while the child process continues running in the background. systemd expects this behavior and will consider the service active as long as the child process is running.
```

Usage: Common for services that daemonize themselves (e.g., Apache, MySQL), which typically fork a new process and let the parent process exit after setup is complete.

Example:

```
[Service]
Type=forking
ExecStart=/usr/sbin/apache2ctl start
ExecStop=/usr/sbin/apache2ctl stop
```

### Commands for Managing systemd Services

Once the unit file is created, use the following commands to manage it:

####Reload systemd to apply changes:
```
sudo systemctl daemon-reload
```

#### Start the service:
```
sudo systemctl start your-service-name.service
```


#### Enable the service on startup:
```
sudo systemctl enable your-service-name.service
```

#### Check the status of the service:

```
sudo systemctl status your-service-name.service
```


#### Stop the service:

```
sudo systemctl stop your-service-name.service
```
- and other commannad used for the systemd units 

#### Example Service
Here’s a sample systemd unit file for a custom web server:

```
[Unit]
Description=Custom Web Server
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/custom-web-server --port=8080
Restart=on-failure
RestartSec=5s
User=webuser
Group=webgroup

[Install]
WantedBy=multi-user.target
Replace /usr/local/bin/custom-web-server and its arguments with the path and options for your executable.
```
