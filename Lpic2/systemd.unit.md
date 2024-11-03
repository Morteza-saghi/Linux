[Service] Type
The Type directive tells systemd how it should expect the service process to behave. Here are the primary types:

Type=simple (default)

Description: This is the default type. systemd considers the service to be running as soon as the ExecStart command begins. systemd does not expect the service to fork a new process or run in the background.
Usage: Good for services that don’t daemonize (run as background processes), such as scripts that remain in the foreground until they’re killed.
Example:

ini
Copy code
[Service]
Type=simple
ExecStart=/usr/bin/python3 -m http.server
Type=forking

Description: Used when the service process forks (spawns a child process) and the parent process exits quickly while the child process continues running in the background. systemd expects this behavior and will consider the service active as long as the child process is running.
Usage: Common for services that daemonize themselves (e.g., Apache, MySQL), which typically fork a new process and let the parent process exit after the setup is complete.
Example:

ini
Copy code
[Service]
Type=forking
ExecStart=/usr/sbin/apache2ctl start
ExecStop=/usr/sbin/apache2ctl stop
