FROM ubuntu

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq python3-pip python3-dev python3-setuptools python3-virtualenv git libyaml-dev build-essential ffmpeg

WORKDIR /opt/octoprint

RUN bash -c "virtualenv venv && \
    source venv/bin/activate && \
    pip install pip --upgrade && \
    pip install octoprint"

RUN bash -c "virtualenv venv && \
    source venv/bin/activate && \
    pip install 'https://github.com/thelastWallE/OctoprintKlipperPlugin/archive/master.zip'"

CMD venv/bin/octoprint serve --iknowwhatimdoing
