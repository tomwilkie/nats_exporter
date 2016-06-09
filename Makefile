PATH_IN_CONTAINER=/go/src/github.com/markuslindenberg/nats_exporter

all: .image.uptodate

.image.uptodate: Dockerfile nats_exporter
	docker build -t tomwilkie/nats_exporter .

nats_exporter:
	docker run -v $(shell pwd):$(PATH_IN_CONTAINER) golang:1.6.2 /bin/sh -c "cd $(PATH_IN_CONTAINER); CGO_ENABLED=0 go build -o $@ -ldflags \"-s -w\" -a -installsuffix cgo ./"

clean:
	rm -f nats_exporter .image.uptodate
