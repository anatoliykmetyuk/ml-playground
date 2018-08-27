FROM tfpg-setup

# Python 2 Environment
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
    scikit            \
    scikit            \
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

RUN conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
