FROM ubuntu:18.04

RUN apt-get update && apt-get install -y bluez python3-dev python3-pip libbluetooth-dev
RUN pip3 install pybluez

COPY bluetooth.py /root/bluetooth.py

CMD ["python3", "/root/bluetooth.py"]
