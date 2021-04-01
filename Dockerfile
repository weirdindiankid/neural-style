FROM nvidia/cuda:9.0-base
RUN apt-get update && apt-get install -y gcc make apt-transport-https ca-certificates build-essential curl software-properties-common python3-pip
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update -y
RUN apt-get install python3.6 python3.6-dev -y
RUN apt-get install python-pip python3-pip -y
RUN apt-get install nvidia-cuda-toolkit -y
WORKDIR /usr/src/app
COPY . .
RUN pip install --upgrade pip
RUN pip3 install --upgrade pip

RUN python3.6 -m pip install --upgrade pip
RUN python3.6 -m pip  install -r requirements.txt
CMD ["python3.6", "neural_style.py"]

