FROM ubuntu:latest
MAINTAINER Frederik Madsen "frede.madsen3@gmail.com"
RUN apt-get update -y
RUN apt-get install -y python3-pip build-essential
WORKDIR /dist
COPY requirements.txt /dist/requirements.txt
RUN pip3 install -r requirements.txt
COPY . /dist
ENTRYPOINT ["python3"]
CMD ["run.py"]
