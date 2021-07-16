from ubuntu:focal


RUN apt update && apt -y install libgtk3.0-cil xvfb

COPY Archi-Linux64-4.8.1.tgz archi.tgz
RUN tar zxvf archi.tgz

RUN echo lolz
WORKDIR Archi

RUN chmod +x ./Archi
RUN rm -rf plugins/com.archimatetool.reports_4.8.1.202101181039/templates
COPY archi-html-report/ plugins/com.archimatetool.reports_4.8.1.202101181039/templates/
RUN ls -al plugins/com.archimatetool.reports_4.8.1.202101181039/templates
COPY plugins/* plugins
RUN mkdir /source
RUN mkdir /target
ENTRYPOINT xvfb-run ./Archi -application com.archimatetool.commandline.app -consoleLog -nosplash --options --modelrepository.loadModel "/source" --html.createReport "/target"
