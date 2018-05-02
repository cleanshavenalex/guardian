COMMIT   = `git rev-parse HEAD`
REPO    ?= github.com/dollarshaveclub/guardian
IMAGE   ?= quay.io/dollarshaveclub/guardian

.PHONY: docker
docker:
	docker build . -t ${IMAGE}:${COMMIT} --build-arg COMMIT=${COMMIT}
	docker push ${IMAGE}:${COMMIT}

.PHONY: cli
cli:
	go install -ldflags "-X ${REPO}/internal/version.CommitSHA=${COMMIT}" ${REPO}/cmd/guardian-cli