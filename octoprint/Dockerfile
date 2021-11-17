FROM debian:buster

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq python3-pip python3-dev git libyaml-dev build-essential ffmpeg
RUN pip3 install virtualenv setuptools

WORKDIR /opt/octoprint

RUN bash -c "virtualenv venv && \
    source venv/bin/activate && \
    pip install pip --upgrade && \
    pip install octoprint"

RUN bash -c "virtualenv venv && \
    source venv/bin/activate && \
    pip install 'https://github.com/thelastWallE/OctoprintKlipperPlugin/archive/master.zip'"

CMD venv/bin/octoprint serve --iknowwhatimdoing
