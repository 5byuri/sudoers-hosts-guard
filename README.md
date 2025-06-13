# sudoers-hosts-guard


![Frame 10](https://github.com/user-attachments/assets/88d677d9-58a9-4299-bff2-6ac440a72d8a)


A minimal system-hardening tool that uses custom sudoers configurations to lock down write access to /etc/hosts, preventing manual overrides of host-based blocklists.

# How does it work?

The system is configured to always require the **root password** for `sudo` commands. The active user does **not** know this password. Ideally, the password is held by someone else — an accountability partner.

The actual user is added to the `%sink` group. This group allows passwordless `sudo` access **except** for commands listed in the `SENSITIVE` alias. The configuration only applies to specific command paths. You can customize it further by adding your own commands.


# Step by Step Guide

<div>
  
1. Create a new group called `%sink`


```sudo groupadd sink```

  
2. Asign our user to `sink`
   
```sudo usermod -a -G sink yournamehere```

  
3. Check if everything has worked

   ```groups yournamehere```
   
  There should be a list of groups including **sink**
  

4. Remove the sudo role, don't worry sudo will still work and this step is safe!

   ```deluser yournamehere sudo```
   
6. Optional: Remove Cached sudo password and try out new sudoers config
   ```sudo -k```

   Make sure that no other Group is messing with the Sink Group configuration, else it won't work!
  </div>


# Polkit rules
These polkit rules will apply to Thunar and create a NOPASS rule when mounting drives

```tba```

# Chattr
Chattr can lockup tools so you can not edit or delete them whatsover, this can be combined with sudoers-hosts-guard to remove yourself from the equation
`tba`

# Flatpak
Configuring Flatpak to prevent installing tools like tor that could bypass the blocklist entirely
`tba`

# nsswitch 
Determines the order of lookup methods (e.g. files, dns, etc.), configuring this part is important to have vpn abide by your /etc/hosts file

`tba`

# Why is the Group called Sink?
This is a reference to <a href="https://en.wikipedia.org/wiki/Behavioral_sink">Behavioral Sink</a>, you could name it anything you want by changing the name in the config.

# Credits

https://serversforhackers.com/c/sudo-and-sudoers-configuration</pre> - this has helped me understand the fundamentals 
https://www.sudo.ws/docs/man/1.8.17/sudoers.man/#Configuring_sudo.conf_for_sudoers - sudo manual
https://github.com/badmojr/addons_1Hosts?tab=readme-ov-file - nsfw blocklist
https://github.com/hagezi/dns-blocklists - misc blocklist

Made with <3 by Byuri

