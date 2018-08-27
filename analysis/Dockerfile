FROM jupyter/tensorflow-notebook

USER root
RUN apt-get update
RUN apt-get --yes install libpq-dev tzdata
USER $NB_USER

RUN pip install --upgrade pip
RUN conda update -n base conda

# Python 2 support, see https://github.com/Cadair/jupyter_environment_kernels
RUN conda create -y -n p2 python=2.7 ipykernel ipython
RUN conda install -y nb_conda_kernels
