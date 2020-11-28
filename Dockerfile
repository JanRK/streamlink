FROM quay.io/janrk/pwsh-slim

RUN  . /etc/os-release; \
        echo "deb https://deb.debian.org/debian $VERSION_CODENAME-backports main" > /etc/apt/sources.list.d/$VERSION_CODENAME-backports.list; \
        apt-get update; \
        apt-get install -y --no-install-recommends ffmpeg curl; \
        apt-get install -y --target-release $VERSION_CODENAME-backports --no-install-recommends streamlink; \
        apt-get purge -y --auto-remove; apt-get clean; rm -rf /var/lib/apt/lists/*; \
        streamlink --version
