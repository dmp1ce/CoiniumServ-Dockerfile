FROM mono:6

LABEL maintainer David Parrish <daveparrish@tutanota.com>
LABEL description="CoiniumServ"

RUN echo "Installing git" \
  && apt-get update && apt-get install -y --no-install-recommends git=1:2* \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && echo "Creating user to run CoiniumServ" \
  && useradd -ms /bin/bash user \
  && usermod -aG sudo user

USER user
# hadolint ignore=DL3003
RUN echo "Downloading CoiniumServ source" \
  && cd ~ \
  && git clone https://github.com/CoiniumServ/CoiniumServ.git \
  && echo "Building CoiniumServ.exe" \
  && cd CoiniumServ \
  && nuget restore \
  && msbuild CoiniumServ.sln /p:Configuration="Release"

# hadolint ignore=DL3002
USER root

ENTRYPOINT ["mono", "/home/user/CoiniumServ/build/bin/Release/CoiniumServ.exe"]
