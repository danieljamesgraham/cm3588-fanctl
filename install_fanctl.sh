#!/usr/bin/bash

sudo cp fanctl.service /etc/systemd/system
sudo cp fanctl /usr/local/sbin
sudo systemctl daemon-reload
sudo systemctl enable --now fanctl
