FROM archlinux/archlinux:latest

ENV URL https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
ENV MD5 2383e4eb4ea23f248d33adc70dc3227e

RUN mkdir /usr/share/gcc-arm-none-eabi                                                           \
 && curl --location "${URL}" --output toolchain.tar                                              \
 && echo "${MD5} toolchain.tar" | md5sum -c -                                                    \
 && tar -C /usr/share/gcc-arm-none-eabi/ -xf toolchain.tar --strip-components 1                  \
 && rm toolchain.tar                                                                             \
 && ln -s /usr/share/gcc-arm-none-eabi/bin/arm-none-eabi-gcc /usr/bin/arm-none-eabi-gcc          \
 && ln -s /usr/share/gcc-arm-none-eabi/bin/arm-none-eabi-g++ /usr/bin/arm-none-eabi-g++          \
 && ln -s /usr/share/gcc-arm-none-eabi/bin/arm-none-eabi-gdb /usr/bin/arm-none-eabi-gdb          \
 && ln -s /usr/share/gcc-arm-none-eabi/bin/arm-none-eabi-size /usr/bin/arm-none-eabi-size        \
 && ln -s /usr/share/gcc-arm-none-eabi/bin/arm-none-eabi-objcopy /usr/bin/arm-none-eabi-objcopy  \
 && ln -s /usr/share/gcc-arm-none-eabi/bin/arm-none-eabi-objdump /usr/bin/arm-none-eabi-objdump  \
 && pacman -Syu base-devel cmake git python3 --needed --noconfirm