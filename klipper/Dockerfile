FROM debian:buster

RUN apt-get update && \
    apt-get install -y git python-virtualenv virtualenv python-dev libffi-dev build-essential libncurses-dev libusb-dev avrdude gcc-avr binutils-avr avr-libc stm32flash libnewlib-arm-none-eabi gcc-arm-none-eabi binutils-arm-none-eabi

WORKDIR /opt
RUN git clone https://github.com/KevinOConnor/klipper

WORKDIR /opt/klipper
RUN bash -c "virtualenv venv && \
    source venv/bin/activate && \
    pip install pip --upgrade && \
    pip install -r /opt/klipper/scripts/klippy-requirements.txt"

COPY run.sh ./

CMD ./run.sh