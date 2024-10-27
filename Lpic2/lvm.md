# Logical Volume Management (LVM) in Linux

Logical Volume Management (LVM) is a flexible and efficient way of managing disk storage in Linux. It abstracts physical storage into logical volumes, allowing dynamic resizing and efficient use of disk space. This guide will help you understand key LVM concepts and commands to set up LVM.

---

## Key Concepts

### 1. **Physical Volume (PV)**
   - A Physical Volume (PV) is the raw disk or partition you prepare for use in LVM. Each PV can be a whole disk, a partition, or a RAID device.
   - **Example command**: `pvcreate /dev/sdb /dev/sdc /dev/sdd`

### 2. **Volume Group (VG)**
   - A Volume Group (VG) is a pool of storage created by grouping multiple PVs. It’s essentially a large, flexible storage space that holds one or more Logical Volumes.
   - **Example command**: `vgcreate vg00 /dev/sdb /dev/sdc`

### 3. **Logical Volume (LV)**
   - Logical Volumes (LVs) are virtual partitions created within a VG. LVs can be resized easily, and each LV can be formatted with its own file system.
   - **Example command**: `lvcreate -n vol_projects -L 10G vg00`

### 4. **Filesystem**
   - After creating an LV, you need to format it with a filesystem (e.g., ext4, xfs) to store data.
   - **Example command**: `mkfs.ext4 /dev/vg00/vol_projects`

---

## Step-by-Step Guide for LVM Setup

### Step 1: Initialize Physical Volumes (PVs)

Use the `pvcreate` command to initialize your physical disks or partitions for LVM.

```
pvcreate /dev/sdb /dev/sdc /dev/sdd
```

Check the PVs with:

```
pvdisplay
```

### Step 2: Create a Volume Group (VG)
Once you have your PVs, create a Volume Group. Here, we’ll name it vg00.
```
vgcreate vg00 /dev/sdb /dev/sdc
```

Verify the VG with:

```
vgdisplay vg00
```


### Step 3: Create Logical Volumes (LVs)
After creating the VG, you can create LVs within it. Let’s create a 10GB LV called vol_projects and a 5GB LV called vol_backups.

```
lvcreate -n vol_projects -L 10G vg00
lvcreate -n vol_backups -L 5G vg00
```
Check the LVs with:

```
lvdisplay
```
### Step 4: Format Logical Volumes
Once your LVs are created, format them with a filesystem. Here, we’ll use the ext4 filesystem.

```
mkfs.ext4 /dev/vg00/vol_projects
mkfs.ext4 /dev/vg00/vol_backups
```

### Step 5: Mount Logical Volumes
After formatting, create mount points and mount the LVs to make them accessible.

```
mkdir /mnt/projects /mnt/backups
mount /dev/vg00/vol_projects /mnt/projects
mount /dev/vg00/vol_backups /mnt/backups
```

To make mounts permanent, add them to /etc/fstab:

```
/dev/vg00/vol_projects /mnt/projects ext4 defaults 0 0
/dev/vg00/vol_backups /mnt/backups ext4 defaults 0 0
```

---

### Summary 

```

# Initialize Physical Volumes
pvcreate /dev/sdb /dev/sdc /dev/sdd

# Display Physical Volumes
pvdisplay

# Create a Volume Group
vgcreate vg00 /dev/sdb /dev/sdc

# Display Volume Groups
vgdisplay

# Create Logical Volumes
lvcreate -n vol_projects -L 10G vg00
lvcreate -n vol_backups -L 5G vg00

# Display Logical Volumes
lvdisplay

# Format Logical Volumes with ext4 filesystem
mkfs.ext4 /dev/vg00/vol_projects
mkfs.ext4 /dev/vg00/vol_backups

# Create Mount Points and Mount the Logical Volumes
mkdir /mnt/projects /mnt/backups
mount /dev/vg00/vol_projects /mnt/projects
mount /dev/vg00/vol_backups /mnt/backups

# Add to /etc/fstab for permanent mounting
echo "/dev/vg00/vol_projects /mnt/projects ext4 defaults 0 0" >> /etc/fstab
echo "/dev/vg00/vol_backups /mnt/backups ext4 defaults 0 0" >> /etc/fstab
```
