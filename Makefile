build-jvm:
	docker build -t getting-started-jvm:0.1 -f docker/jvm.Dockerfile .

build-native:
	docker build -t getting-started-native:0.1 -f docker/native.Dockerfile .

build-distroless:
	docker build -t getting-started-distroless:0.1 -f docker/distroless.Dockerfile .

show:
	docker images | grep getting

up:
	docker-compose up

down:
	docker-compose down

delete:
	docker rmi -f getting-started-jvm:0.1
	docker rmi -f getting-started-native:0.1
	docker rmi -f getting-started-distroless:0.1

build-all:
	docker build -t getting-started-jvm:0.1 -f docker/jvm.Dockerfile .
	docker build -t getting-started-native:0.1 -f docker/native.Dockerfile .
	docker build -t getting-started-distroless:0.1 -f docker/distroless.Dockerfile .