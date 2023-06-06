########
# DOCKER_BUILDKIT=1 docker build -t my-texlive-23 .
# docker run -v .:/work --env GU_IDS="$(id -u):$(id -g)" -it my-texlive-23
########


FROM texlive/texlive:TL2022-historic
# FROM registry.gitlab.com/islandoftex/images/texlive:TL2022-historic

WORKDIR /work
CMD bash /work/_docker_run.sh

