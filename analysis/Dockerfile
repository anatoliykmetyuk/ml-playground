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


########## PYTHON 2.7 ##########

RUN conda create -y -n p2 python=2.7 \
    ipykernel         \
    ipython           \
    'blas=*=openblas' \
    ipywidgets        \
    pandas            \
    numexpr           \
    matplotlib        \
    scipy             \
    seaborn           \
    scikit-learn      \
    scikit-image      \
    sympy             \
    cython            \
    patsy             \
    statsmodels       \
    cloudpickle       \
    dill              \
    numba             \
    bokeh             \
    sqlalchemy        \
    hdf5              \
    h5py              \
    vincent           \
    beautifulsoup4    \
    protobuf          \
    xlrd              \
    tensorflow        \
    keras


########## POSTGRES ##########

RUN conda install -y psycopg2
RUN conda install -y -n p2 psycopg2


########## TENSORBOARD ##########

RUN conda install -y tensorboard
RUN conda install -y -n p2 tensorboard


########## THEANO BACKEND ##########

RUN conda install -y mkl-service
RUN conda install -y -n p2 mkl-service

ENV MKL_THREADING_LAYER=GNU

RUN conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER


########## MINOR CONFIGURATION ##########

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
