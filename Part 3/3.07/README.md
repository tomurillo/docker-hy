## Python (Flask) Image Size Optimization

For this exercise I have optimized the image size for a personal project: the Buddy Recommender API ([Github](https://github.com/tomurillo/Buddy-Recommender-API)).

The project is a RESTful API built with [Flask](https://flask.palletsprojects.com), a Python web framework.

### Dockerfiles

The previous Dockerfile was as follows (comments removed):

```dockerfile
FROM python:3.9

RUN groupadd --gid 1000 app && \
    useradd --create-home --gid 1000 --uid 1000 app

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

RUN pip install uwsgi

COPY . .
EXPOSE 5000

ENV FLASK_APP=manage.py
ENV FLASK_ENV=production

RUN mkdir -p buddy_recommender/main/storage
RUN python manage.py db upgrade
RUN chown -R app:app buddy_recommender/main/storage

USER app

CMD ["uwsgi", "/app/wsgi.ini", "-w", "wsgi:app"]
```

A new Dockefile has been created to decrease the size of the built image, including:

* Multi-stage build
* Use of smaller base images (`python-slim`)
* The non-root user has been kept for security reasons

The resulting Dockerfile is as follows:

```dockerfile
FROM python:3.9-slim as compile-stage

# Install build tools
RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential gcc

WORKDIR /app

# Switch to non-root user
RUN groupadd --gid 1000 appgroup && \
    useradd --create-home --gid 1000 --uid 1000 appuser
USER appuser

# Copy requirements to ensure that Docker will cache them
# instead of reinstalling them on every build
COPY requirements.txt .
RUN pip install --no-warn-script-location --user -r requirements.txt

# install uWSGI (not in requrements.txt as it is not needed
# in development/test environments):
RUN pip install --no-warn-script-location --user uwsgi


FROM python:3.9-slim

# Copy non-root user and group from compile stage
RUN groupadd --gid 1000 appgroup && \
    useradd --create-home --gid 1000 --uid 1000 appuser

# Copy compiled files
COPY --from=compile-stage /home/appuser/.local /home/appuser/.local
ENV PATH=/home/appuser/.local/bin:$PATH

WORKDIR /app

# Copy codebase
COPY . .
EXPOSE 5000

# Set environment flags
ENV FLASK_APP=manage.py
ENV FLASK_ENV=production

# Change owner of DB files to allow writing
RUN chown -R appuser:appgroup buddy_recommender/main/storage

# Change user to non-root
USER appuser

# Run migrations script
RUN python manage.py db upgrade

# Run server
CMD ["uwsgi", "/app/wsgi.ini", "-w", "wsgi:app"]
```

### Image Size Comparison

Let's compare the sizes of the generated images with each Dockerfile:

```bash
(base) tomas@tomas-ubuntu:~$ docker image ls
REPOSITORY     TAG      IMAGE ID       CREATED             SIZE
buddy-api      latest   e58f07959b1e   33 minutes ago      471MB
buddy-api-old  latest   8cabf078b5f9   24 hours ago        1.36GB
...
```

Using the new Dockerfile, we obtain an image size of **471MB**, a reduction of **65.4%** with respect to the old image. Such reduction is mostly the result of employing a slimmer base image.