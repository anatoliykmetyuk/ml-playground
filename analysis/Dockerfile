FROM tfpg-python-postgres

RUN mkdir .jupyter/nbconfig
RUN echo '\
{\
  "CodeCell": {\
    "cm_config": {\
      "indentUnit": 2\
    }\
  }\
}\
' > .jupyter/nbconfig/notebook.json

ENV TENSORBOARD_LOG_DIR="/home/jovyan/work/logs/"

CMD start-notebook.sh & tensorboard --logdir $TENSORBOARD_LOG_DIR
