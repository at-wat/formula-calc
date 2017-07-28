FROM ubuntu:xenial

RUN apt-get -qq update && \
	apt-get install -y -qq --no-install-recommends sudo build-essential libgtest-dev cmake && \
	apt-get clean -qq && \
	rm -rf /var/lib/apt/lists/*

COPY ./ /usr/src/formula-calc/

RUN mkdir /usr/src/formula-calc/build && cd /usr/src/formula-calc/build && \
	cmake .. && \
	make && make test && \
	sudo make install &&
	rm -rf /usr/src/formula-calc/build
