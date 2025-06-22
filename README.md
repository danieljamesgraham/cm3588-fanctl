# CM3588 NAS Fan Control

Simple PWM fan control script for the CM3588 NAS development board.

Tested on `Armbian_community 25.8.0` with the `6.12.30-current-rockchip64` kernel.

## Script (fanctl)

Adjust `LO_TEMP` and `HI_TEMP` to change the temperatures at which the fan starts spinning and increases its speed respectively. Modifying `HYSTERESIS` alters the range below these temperatures at which the fan speed remains unchanged.

`LO_SPEED` and `HI_SPEED` are the fan's PWM duty cycles and should be adjusted depending on the setup used. The existing values work well with a Noctua 40x10mm 3-pin fan (PWM pin not connected) inside an AliExpress metal case, but may need to be tweaked for different configurations.

## Installation

### Blacklist Fan Control Kernel Module

``` bash
echo "blacklist pwm_fan" | sudo tee /etc/modprobe.d/blacklist-pwmfan.conf
sudo update-initramfs -u
```

### Enable PWM Device Tree Overlay

1. Run `sudo armbian-config`.
2. Navigate to device tree overlays (`SYSTEM` --> `KERNEL` --> `DTO001`).
3. Enable `rockchip-rk3588-pwm1-m1`.
4. Reboot.

### Enable Fan Control Service

```
sudo cp fanctl.service /etc/systemd/system
sudo cp fanctl /usr/local/sbin
sudo systemctl daemon-reload
sudo systemctl enable --now fanctl
```
