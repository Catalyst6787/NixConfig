{ config, pkgs, ... }:

{
  boot.initrd.availableKernelModules = [
    "xhci_pci"   # xHCI USB 3 controller driver
    "xhci_hcd"   # xHCI core
    "ehci_pci"   # (optional, older USB 2.0 controllers)
    "uhci_hcd"   # (optional, USB 1.1 controllers)
    "usbhid"     # USB keyboard/mouse driver
    "hid_generic"
  ];
}
