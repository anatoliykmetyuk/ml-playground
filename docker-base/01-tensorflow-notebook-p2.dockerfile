FROM jupyter/tensorflow-notebook

# Update the system
USER root
RUN apt-get update
RUN apt-get --yes install libpq-dev tzdata
USER $NB_USER

RUN pip install --upgrade pip
RUN conda update -n base conda

# Jupyter support for Conda environments: https://stackoverflow.com/a/44786736/3895471
RUN conda install -y nb_conda_kernels

# === Python 2 Environment START ===
RUN conda create -y -n p2 python=2.7 ipykernel ipython
RUN bash -c 'source activate p2'

# base-notebook
RUN conda install -y \
    'notebook=5.4.*' \
    'jupyterhub=0.8.*' \
    'jupyterlab=0.32.*'
RUN conda clean -tipsy && \
    jupyter labextension install @jupyterlab/hub-extension@^0.8.1 && \
    npm cache clean --force && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    rm -rf /home/$NB_USER/.cache/yarn && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# scipy-notebook
RUN conda install -y \
    'blas=*=openblas' \
    'ipywidgets=7.1*' \
    'pandas=0.19*' \
    'numexpr=2.6*' \
    'matplotlib=2.0*' \
    'scipy=0.19*' \
    'seaborn=0.7*' \
    'scikit-learn=0.19*' \
    'scikit-image=0.13*' \
    'sympy=1.0*' \
    'cython=0.25*' \
    'patsy=0.4*' \
    'statsmodels=0.8*' \
    'cloudpickle=0.2*' \
    'dill=0.2*' \
    'numba=0.31*' \
    'bokeh=0.12*' \
    'sqlalchemy=1.1*' \
    'hdf5=1.8.17' \
    'h5py=2.6*' \
    'vincent=0.4.*' \
    'beautifulsoup4=4.5.*' \
    'protobuf=3.*' \
    'xlrd'
RUN conda remove --quiet --yes --force qt pyqt && \
    conda clean -tipsy && \
    # Activate ipywidgets extension in the environment that runs the notebook server
    jupyter nbextension enable --py widgetsnbextension --sys-prefix && \
    # Also activate ipywidgets extension for JupyterLab
    jupyter labextension install @jupyter-widgets/jupyterlab-manager@^0.35 && \
    jupyter labextension install jupyterlab_bokeh@^0.5.0 && \
    npm cache clean --force && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    rm -rf /home/$NB_USER/.cache/yarn && \
    rm -rf /home/$NB_USER/.node-gyp && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# tensorflow-notebook
RUN conda install -y \
    'tensorflow=1.5*' \
    'keras=2.1*'
RUN conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN bash -c 'source deactivate'
# === Python 2 Environment END ===
