# GDS-R: a GDS containerised environment for RStudio

This project extends the fantastic [`rocker-geospatial`](https://github.com/rocker-org/geospatial) to include further libraries required by the activities of the [Geographic Data Science Lab](https://www.liverpool.ac.uk/geographic-data-science/).

Containers are available at [Docker Hub](https://hub.docker.com/r/darribas/gdsr)

## Install

To run `gdsr` you will need [Docker](https://docker.com) on your machine. Once
ready, you can install the container by typing:

```shell
docker pull darribas/gdsr
```

Or if you want a Python distribution as well:

```shell
docker pull darribas/gdsrpy
```

Make sure to have a stable and good internet connection as the images are about 8G and 13G, respectively.

## Use

This image builds directly on the Rocker-geospatial project, and the only
difference is that it comes loaded with additional libraries. Hence, usage is
similar to that of any Rocker image. Please check [their documentation](https://www.rocker-project.org/)
for guidance.

For version `2.0`, you can boot up the server by:

```shell
docker run --rm -ti -e PASSWORD=<your password> -v /folder/to/mount:/home/rstudio/work -p 8787:8787 gdsr
```

This will mount a folder from the host on the `work` folder on the container side, which you can see and access when you login.

## Build [Optional]

**NOTE** - This is _not_ required or recommended unless you know what you're
doing!

If, instead of installing a built image, you prefer to build your own locally,
you will need a copy of this repository. Once that is available in your
machine, navigate into it:

```shell
cd /path/to/repo/folder/
```

And you can build the image with:

```shell
docker build -t gdsr .
```

