FROM python:3.8.3

RUN apt-get update

RUN apt-get install -y --no-install-recommends libboost-all-dev
RUN apt-get install -y bluez \
  bluetooth \
  pkg-config \
  libboost-python-dev \
  libboost-thread-dev \
  libbluetooth-dev \
  libglib2.0-dev \
  python3-dev \
  libgirepository1.0-dev \
  gcc \
  libcairo2-dev \
  gir1.2-gtk-3.0

RUN pip3 install --upgrade pip
RUN pip3 install pycairo PyGObject dasbus

ENTRYPOINT ["python"] 
