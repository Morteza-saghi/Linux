## Apt and Dpkg Commands Cheat Sheet



### Download and Install Packages

---

#### Download Only (Without Installation)

```
apt install tmux --download-only
```
Purpose: Downloads the necessary packages for tmux without installing them.
Use Case: Useful for downloading packages to a server where you may want to install them later.

---

#### Download .deb Package Only

```
apt download tmux
```

Purpose: Downloads the .deb package for tmux without downloading its dependencies.
Use Case: Ideal when you need just the package file for manual installation.

---

#### Install a .deb Package

```
dpkg -i package_name.deb
```

Purpose: Installs a .deb package on the server.
Use Case: Use this after downloading a package with apt download.

---


#### Fix Missing Dependencies

```
apt-get install -f
```

Purpose: Installs any missing dependencies for packages already on your system.
Use Case: Run this if dpkg -i reports missing dependencies.


---


### Manage Installed Packages


#### Remove Unused Packages

```
apt autoremove
```

Purpose: Cleans up packages that were installed as dependencies but are no longer needed.
Use Case: Helps keep your system clean and free of unnecessary files.

---

#### List Installed Packages

```
dpkg -l
```

Purpose: Lists all packages currently installed on the server.
Use Case: Useful for auditing or checking the installed software.

---

#### Reconfigure Installed Packages


```
dpkg-reconfigure package_name
```

Purpose: Re-runs the initial setup for a package, allowing you to change settings or correct configuration issues.
Use Case: Use this to adjust configurations after the package is already installed.

---

### Search for Packages

#### Search for a Package by Name

```
apt search vlc
```
Purpose: Searches for a package named vlc or related packages.
Use Case: Quickly find a package to install or check if it's available in your repositories.

---
