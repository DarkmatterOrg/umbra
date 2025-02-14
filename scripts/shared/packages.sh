#!/bin/bash

set -ouex pipefail

rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | tee /etc/yum.repos.d/vscode.repo

wget -O vesktop.rpm https://vencord.dev/download/vesktop/amd64/rpm

rpm-ostree install vesktop.rpm && rm vesktop.rpm

rpm-ostree install virt-manager virt-install libvirt-daemon-config-network libvirt-daemon-kvm qemu-kvm virt-viewer libguestfs-tools python3-libguestfs virt-top swtpm edk2-ovmf nvtop btop zsh zoxide fzf code kitty

systemctl enable podman.socket libvirtd
