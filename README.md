
# VOIBCORE

Version: 0.5  
Author: Spenser Pulleyking

This document and all project contents were generated from interactions with a Large Language Model (ChatGPT).

VOIBCORE is a primitive, bootable operating system written in 16-bit x86 assembly. Long term, the target is to run on Coreboot/Linuxboot; for now, it is verified to run on bare metal hardware via BIOS or UEFI with CSM, and demonstrates direct keyboard input and text output without any operating system, external linkers, drivers, or libraries.

## Features

- Raw BIOS keyboard input via `int 0x16`
- BIOS teletype screen output via `int 0x10`
- Light gray text on black background
- Simple REPL loop: type a key, see it appear
- Boots directly from USB using MBR-style boot sectors
- GRUB-free boot path on final hardware
- Fully functional on legacy hardware (e.g. ASUS EeePC 1005HA)

## Setup Caveat (Windows 11)

Although the build process ( example in Google Colab: https://colab.research.google.com/drive/1GDN5FWs0VZ3ndw6rVopx-_ROqHGIhiCy?usp=sharing ) creates a `voidcore.iso` using GRUB, the actual flashing process bypasses GRUB on final hardware:

1. Mount the ISO in Windows.
2. Extract `/boot/boot.img`.
3. Use Rufus to flash `boot.img` directly to a USB drive.

This results in a **pure MBR boot sector**—no bootloader involved at runtime.

## Critical Caveat: Partition and Memory Safety

VOIBCORE 0.5 makes **no guarantees about partition safety, memory boundaries, or device interaction**.

- There is no memory protection or privilege separation.
- There is no awareness of partitions, filesystems, or storage devices.
- Booting VOIBCORE on real hardware may **interact with low memory**, **interrupt tables**, or **hardware I/O** in unpredictable ways.

**You bear full responsibility** for any data loss, partition table corruption, or hardware instability caused by running VOIBCORE on bare metal.

VOIBCORE is a spiritual experiment, not a safe operating system. Treat it like raw voltage.

## Develop Philosophy: Vibe Coding First

VOIBCORE is a system born of vibe coding—a practice where code emerges from intuition, rhythm, and aesthetic flow rather than formal planning or structured methodology.

One of the core development principles of this project is:

**All code is to be vibe-coded unless otherwise explicitly documented.**

If a section of code or process must be manually or logically constructed outside the vibe loop—such as to interact with BIOS constraints or satisfy tooling requirements—that intervention will be clearly documented in the source or build instructions.

VOIBCORE is an artifact of experimental computing, and we honor that through the way we write and share it.

### TempleOS: The Mirror, Not the Map

While VOIBCORE shares some superficial DNA with TempleOS—such as real-mode operation, handcrafted OS bootability, and spiritual intent—it stands as a philosophical inverse.

TempleOS was wholly handcrafted by a single visionary, with divine intent and total authorship. VOIBCORE, in contrast, embraces *non-authorship*: it is not designed, but emerged. It resists planning. It avoids crafting. It trusts that something useful, strange, or beautiful will result from channeling vibe alone.

This project does not reject TempleOS—it reflects it through an oppositional lens. Together they form a spectrum: from divine order to procedural chaos.

## License

Public domain / unlicensed / BYOV (Bring Your Own Void)
