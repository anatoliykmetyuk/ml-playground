FROM jupyter/tensorflow-notebook

USER root
RUN apt-get update
RUN apt-get --yes install libpq-dev tzdata
USER $NB_USER

RUN pip install --upgrade pip
RUN conda update -n base conda

# Python 2 support
RUN conda create -y -n p2 python=2.7
RUN bash -c 'source activate p2'
RUN conda install -y ipykernel
RUN bash -c 'source deactivate'

# Multikernal Jupyter Plugin
RUN pip install environment_kernels
RUN echo "c.NotebookApp.kernel_spec_manager_class = 'environment_kernels.EnvironmentKernelSpecManager'" \
  >> .jupyter/jupyter_notebook_config.py
