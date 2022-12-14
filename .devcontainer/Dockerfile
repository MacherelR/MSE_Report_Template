# FROM ubuntu:22.04
# LABEL maintainer="Remy Macherel"

# ARG USERNAME=latex
# ARG WORKDIR=/latex
# ARG USER_UID=1000
# ARG USER_GID=$USER_UID
# ARG DEBIAN_FRONTEND=noninteractive

# RUN apt-get update

# RUN apt-get install -y git python3 python3-pip wget xvfb locales
# RUN apt-get install -y inkscape
# RUN apt-get install -y biber

# # Pygments for LaTeX minted
# #RUN pip install control Pygments

# RUN apt-get install -y \
#     texlive-base \
#     texlive-bibtex-extra \
#     texlive-lang-french \
#     texlive-xetex \
#     texlive-extra-utils

# RUN apt-get install -y texlive-latex-extra
# RUN apt-get install -y python3-pygments
# # Draw.io for building figures
# RUN apt-get install -y libnotify4 libxss1 xdg-utils libsecret-1-0 libappindicator3-1 libgbm1 libasound2
# # RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v19.0.3/draw.io-arm64-19.0.3.zip
# # RUN unzip draw.io-arm64-19.0.3.zip
# # RUN cd draw.io.app

# # RUN unzip drawio
# # RUN dpkg -i drawio-arm*
# # RUN apt-get install snapd -y
# # RUN source ~/.bashrc
# # RUN snap install drawio
# # RUN apt -y install wget curl
# # RUN curl -s https://api.github.com/repos/jgraph/drawio-desktop/releases/latest | grep browser_download_url | grep '\.deb' | cut -d '"' -f 4 | wget -i -
# # RUN apt -f install ./drawio-arm64-*.deb

# RUN apt-get install -y latexmk
# RUN apt-get install -y texlive-science

# # Set the locale
# RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
# ENV LANG en_US.UTF-8
# ENV LANGUAGE en_US:en
# ENV LC_ALL en_US.UTF-8

# # Update font cache
# RUN fc-cache -fv

# # Clear cache, man page and documentation
# RUN apt-get clean -y &&\
#     rm -rf /var/lib/apt/lists/* &&\
#     rm -rf /usr/share/man &&\
#     rm -f /etc/ssh/ssh_host_* &&\
#     mkdir -p /usr/share/man &&\
#     find /usr/share/doc -depth -type f ! -name copyright -delete &&\
#     find /usr/share/doc -type f -name "*.pdf" -delete &&\
#     find /usr/share/doc -type f -name "*.gz" -delete &&\
#     find /usr/share/doc -type f -name "*.tex" -delete &&\
#     (find /usr/share/doc -type d -empty -delete || true) &&\
#     mkdir -p /usr/share/doc &&\
#     rm -rf /var/cache/apt/archives &&\
#     mkdir -p /var/cache/apt/archives &&\
#     rm -rf /tmp/* /var/tmp/* &&\
#     (find /usr/share/ -type f -empty -delete || true) &&\
#     (find /usr/share/ -type d -empty -delete || true) &&\
#     mkdir -p /usr/share/texmf/source &&\
#     mkdir -p /usr/share/texlive/texmf-dist/source


# # Create the user
# # RUN groupadd --gid $USER_GID $USERNAME &&\
# #     useradd --uid $USER_UID --gid $USER_GID -m $USERNAME &&\
# #     echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME &&\
# #     chmod 0440 /etc/sudoers.d/$USERNAME
# # RUN mkdir -p ${WORKDIR} && chown ${USERNAME}:${USERNAME} ${WORKDIR}
# # USER $USERNAME
# # ENV USER=${USERNAME}
# WORKDIR /latex

# # Bind bashrc
# # ADD .bashrc /root/.bashrc
# # ADD .bashrc /home/${USERNAME}/.bashrc

FROM ubuntu:22.04 
#debian:testing

ARG USER_NAME=latex
ARG USER_HOME=/home/latex
ARG USER_ID=1000
ARG USER_GECOS=LaTeX
ARG DEBIAN_FRONTEND=noninteractive

RUN adduser \
  --home "$USER_HOME" \
  --uid $USER_ID \
  --gecos "$USER_GECOS" \
  --disabled-password \
  "$USER_NAME"

ARG WGET=wget
ARG GIT=git
ARG SSH=openssh-client
ARG MAKE=make
ARG PANDOC=pandoc
ARG PCITEPROC=pandoc-citeproc
ARG PYGMENTS=python3-pygments
ARG PYTHONIS=python-is-python3
ARG FIG2DEV=fig2dev
ARG JRE=default-jre-headless

RUN apt-get update && apt-get install -y \
  texlive-full \
  # some auxiliary tools
  "$WGET" \
  "$GIT" \
  "$SSH" \
  "$MAKE" \
  # markup format conversion tool
  "$PANDOC" \
  "$PCITEPROC" \
  # XFig utilities
  "$FIG2DEV" \
  # syntax highlighting package
  "$PYGMENTS" \
  # temporary fix for minted, see https://github.com/gpoore/minted/issues/277
  "$PYTHONIS" \
  # Java runtime environment (e.g. for arara)
  "$JRE" && \
  # Removing documentation packages *after* installing them is kind of hacky,
  # but it only adds some overhead while building the image.
  apt-get --purge remove -y .\*-doc$ && \
  # Remove more unnecessary stuff
  apt-get clean -y

