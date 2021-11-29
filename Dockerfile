from ubuntu:focal


RUN apt update && apt -y install libgtk3.0-cil xvfb

COPY Archi-Linux64-4.9.1.tgz archi.tgz
RUN tar zxvf archi.tgz

WORKDIR Archi

RUN chmod +x ./Archi
COPY dropins/* dropins/
RUN mkdir /source
RUN mkdir /target
ENTRYPOINT xvfb-run ./Archi -application com.archimatetool.commandline.app -consoleLog -nosplash --options --modelrepository.loadModel "/source" --html.createReport "/target"