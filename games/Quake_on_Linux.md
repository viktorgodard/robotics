# Installing Quake on Ubuntu Linux 20.04

20211223
Viktor Godard


Find out what is available: 

    sudo apt search quake

There are many options:

1. Alien Arena
2. Dark Places
3. ETQW
4. ioquake
5. Open Arena
6. Quake, Quake2, Quake3, Quake4

Other interesting apps:
- qstat = CLI to query quake (and other) servers
- yakuake = quake-style terminal emulator (KDE based)
- golang-github-alecthomas-colour-dev = Quake-style colour formatting for Unix terminals

---

Installing Open Arena since it is the only one that comes with data files: 

    sudo apt search openarena
    sudo apt install openarena

It crashes because I have a basic video card (no ray-tracing), see: 

    less ~/.openarena/baseoa/crashlog.txt 


The only package not installed is: openarena-server

---

### Conclusion:

There are issues with my current video card (Intel), it is not powerful enough. 
It is not worth the effort, so I removed Open Arena and all its dependencies: 

    sudo apt remove openarena
    sudo apt autoremove


TODO: TRY AGAIN when I get a 2022 Linux laptop with a proper AMD CPU and GPU.

---
