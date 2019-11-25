FROM ubuntu

RUN apt-get update && \
    apt-get install -y python-pip python-dev python-setuptools python-virtualenv git libyaml-dev build-essential

WORKDIR /opt/octoprint

RUN bash -c "virtualenv venv && \
    source venv/bin/activate && \
    pip install pip --upgrade && \
    pip install octoprint"

RUN bash -c "virtualenv venv && \
    source venv/bin/activate && \
    pip install 'https://github.com/mmone/OctoPrintKlipper/archive/master.zip'"

CMD venv/bin/octoprint serve --iknowwhatimdoing
