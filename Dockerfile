FROM python:3.9
COPY requirements.txt ./
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get autoremove -y \
    && apt-get install -y \
        gcc \
	libc-dev\
        build-essential \
        zlib1g-dev \
        wget \
        unzip \
        cmake \
        python3-dev \
        gfortran \
        libblas-dev \
        liblapack-dev \
	tcpdump \
	libpcap-dev\
        libatlas-base-dev \
    && apt-get clean
RUN pip install -U pip
RUN pip install --no-cache-dir -r requirements.txt

RUN git clone https://github.com/datthinh1801/cicflowmeter.git
#WORKDIR /cicflowmeter
#WORKDIR src
#ENV PYTHONPATH "${PYTHONPATH}:.$"
WORKDIR /cicflowmeter
RUN python setup.py install
ENTRYPOINT ["cicflowmeter"]

