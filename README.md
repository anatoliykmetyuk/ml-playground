# Features
This is a data science playground. It includes:

- Jupyter Notebook.
  - Supports Python 3.6 and Python 2.7 as different Jupyter Notebook kernels.
  - Accessible at `localhost:8888`.
  - The root directory of the notebook is `analysis`.
  - Supports all the libraries [tensorflow-notebook](https://github.com/jupyter/docker-stacks/tree/master/tensorflow-notebook) Docker image supports, for both versions of Python.
- Tensorboard support.
  - Accessible at `localhost:6006`.
  - Reads logs from `analysis/logs`.
  - Exposes `TENSORBOARD_LOG_DIR` environmental variable that points to that directory within the Docker container. You can use this variable from the notebooks.
- Postgres database in a separate Docker container, accessible at `localhost:5432`.
  - You can initialize it with custom SQL scripts by placing them in the `database` folder and uncommenting the `ADD ./*.sql /docker-entrypoint-initdb.d/` line in `database/Dockerfile`.
- Demo notebooks with examples of the notebook usage.
  - Keras & Tensorflow: demonstrates how to use these two with Tensorboard that ships with this playground.
  - Postgres: demonstrates how to connect to the Postgres database of this sandbox and read data as Pandas DataFrames.

# Running the Servers
To run the playground, execute the following command:

```bash
docker-compose down; docker-compose build; docker-compose up
```

You will get the above features accessible at the specified URLs.

To access Jupyter Notebook, you will need an access token. Keep an eye on the console output of the above command and look for the lines like follows:

```
tfpg_analysis | [I 14:33:07.656 NotebookApp] The Jupyter Notebook is running at:
tfpg_analysis | [I 14:33:07.656 NotebookApp] http://(42140b2eee79 or 127.0.0.1):8888/?token=e2ab752a6e907b44f28f72dfd9e7c6e39957051e5b802753
```

The token here is: `e2ab752a6e907b44f28f72dfd9e7c6e39957051e5b802753`.

# Architecture
The playground consists of two docker containers:

- `tfpg_analysis` – contains the Jupyter Notebook, TensorBoard and many Python libraries for Data Science.
- `tfpg_database` – contains the Postgres database.

`tfpg_database` persists its data under the `_volumes/postgres-data` directory. The `analysis` directory is mounted to the home directory of the `tfpg_analysis` container default user – so it can be accessed from that container.

# Connecting to the Analysis server
You can open a command line shell at the `tfpg_analysis` container to run Python scripts placed under `analysis` directory. To do so, after you start the servers as described in "Running the Servers", run:

```bash
docker exec -ti tfpg_analysis start.sh
```

If you would like to be able to use passwordless `sudo` from the container, run the following command:

```bash
docker exec -tiu root tfpg_analysis start.sh
```
