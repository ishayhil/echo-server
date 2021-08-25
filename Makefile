DOCKER_REPO = jmalloc/echo-server
DOCKER_BUILD_ARGS = --platform linux/amd64

-include .makefiles/Makefile
-include .makefiles/pkg/go/v1/Makefile
-include .makefiles/pkg/docker/v1/Makefile

run: $(GO_DEBUG_DIR)/echo-server
	$< $(RUN_ARGS)

.makefiles/%:
	@curl -sfL https://makefiles.dev/v1 | bash /dev/stdin "$@"
