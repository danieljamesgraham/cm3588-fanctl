# CM3588 NAS Fan Control

## Installation

### Blacklist the Fan Control Kernel Module

``` bash
echo "blacklist pwm_fan" | sudo tee /etc/modprobe.d/blacklist-pwmfan.conf
sudo update-initramfs -u
```

### Enable Fan PWM Device Tree Overlay

1. Run `sudo armbian-config`.
2. Navigate to device tree overlays (`SYSTEM` --> `KERNEL` --> `DTO001`).
3. Enable `rockchip-rk3588-pwm-m1`.
4. Reboot.

### Enable the Fan Control Service

```
sudo cp fanctl.service /etc/systemd/system
sudo cp fanctl /usr/local/sbin
sudo systemctl daemon-reload
sudo systemctl enable --now fanctl
```
