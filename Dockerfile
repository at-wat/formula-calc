FROM ubuntu:xenial

RUN apt-get -qq update && \
	apt-get install -y --no-install-recommends sudo build-essential libgtest-dev && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir build && cd build && \
	cmake .. && \
	make && make test && \
	sudo make install
