FROM tfpg-python2-env

########## POSTGRES ##########

RUN conda install -y psycopg2
RUN conda install -y -n p2 psycopg2


########## TENSORBOARD ##########

RUN conda install -y tensorboard
RUN conda install -y -n p2 tensorboard

RUN conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
