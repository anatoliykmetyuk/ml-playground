FROM tfpg-python2-env

RUN conda install -y psycopg2
RUN conda install -y -n p2 psycopg2
RUN conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
