FROM jupyter/tensorflow-notebook

########## SETUP ##########

# Update the system
USER root
RUN apt-get update
RUN apt-get --yes install libpq-dev tzdata
USER $NB_USER

RUN pip install --upgrade pip
RUN conda update -n base conda

# Jupyter support for Conda environments: https://stackoverflow.com/a/44786736/3895471
RUN conda install -y nb_conda_kernels
