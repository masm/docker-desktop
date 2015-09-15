FROM masm/archlinux
MAINTAINER Marco Monteiro <marco@neniu.org>

RUN echo -e '\n[multilib]\nInclude = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf && \
    echo -e '\n[atlassian]\nSigLevel = PackageOptional DatabaseRequired TrustAll\nServer = http://downloads.hipchat.com/linux/arch/$arch' >> /etc/pacman.conf && \
    pacman -Sqy --needed --noconfirm --noprogressbar \
           chromium \
           firefox \
           flashplugin \
           gst-libav \
           gst-plugins-good \
           hipchat \
           opera \
           teamviewer && \
    yes | pacman -Sqcc && \
    rm -rf /usr/share/man/*
