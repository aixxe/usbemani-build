# usbemani-build

Arch-based Docker image for building [USBemani](https://github.com/progmem/usbemani).

```sh
# build and tag the image
docker build -t usbemani-build .

# spawn interactive shell in the build image
docker run --rm -it -u $(id -u):$(id -g) -v $(pwd):/build -w /build usbemani-build

# clone upstream repository with all dependencies
git clone --recursive https://github.com/progmem/usbemani.git
cd usbemani

# build
mkdir -p build
make lain/mini-4:default
```