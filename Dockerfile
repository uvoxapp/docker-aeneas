FROM buildpack-deps:sid

RUN set -x
RUN apt update 
RUN apt install -y espeak 
RUN apt install -y ffmpeg 
RUN apt install -y libsndfile1 
RUN apt install -y libsndfile1-dev
RUN apt install -y python 
RUN python --version
RUN apt install -y python-dev 
RUN apt install -y python-pip 
RUN apt install -y python-numpy 
RUN apt install -y python-lxml 
RUN apt install -y python-bs4
RUN rm -rf /var/lib/apt/lists/*
RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app
RUN git clone https://github.com/readbeyond/aeneas.git aeneas_root

COPY requirements.txt /usr/src/app/requirements.txt
RUN pip install -r requirements.txt

COPY . /usr/src/app/
RUN ln  -s aeneas_root/aeneas/ aeneas
# COPY util/*.py /usr/src/app/util/
# COPY service.py /usr/src/app/service.py

# Make port 80 available to the world outside this container
EXPOSE 80

CMD [ "python", "service.py"]
