PLATFORM_IOS = iOS Simulator,name=iPhone 11 Pro
PLATFORM_MACOS = macOS
PLATFORM_TVOS = tvOS Simulator,name=Apple TV

default: test

benchmarks:
	swift run -c release swift-parsing-benchmark

test:
	xcodebuild test \
		-workspace Parsing.xcworkspace \
		-scheme Parsing \
		-destination platform="$(PLATFORM_IOS)"
	xcodebuild test \
		-workspace Parsing.xcworkspace \
		-scheme Parsing \
		-destination platform="$(PLATFORM_MACOS)"
	xcodebuild test \
		-workspace Parsing.xcworkspace \
		-scheme Parsing \
		-destination platform="$(PLATFORM_TVOS)"

test-linux:
	docker run \
		--rm \
		-v "$(PWD):$(PWD)" \
		-w "$(PWD)" \
		swift:5.3 \
		bash -c 'make test-swift'

test-swift:
	swift test \
		--enable-test-discovery \
		--parallel

format:
	swift format --in-place --recursive \
		./Package.swift ./Sources ./Tests
	find . -type f -name '*.md' -print0 | xargs -0 perl -pi -e 's/ +$$//'

generate-variadics:
	swift run variadics-generator \
		--generate-zips \
		--generate-one-ofs \
		> Sources/Parsing/Builders/Variadics.swift


# MARK: - Swift Compiler build tests

DOCKER_CMD = \
	docker run \
	--rm \
	-v $(PWD):/host \
	-w "/host"

TEST_SCRIPT = bash -c "\
	cd ..; \
	cp -r host container; \
	cd container; \
	swift package clean; \
	swift test --parallel; \
	"

test-5-9:
	$(DOCKER_CMD) \
	swift:5.9.2 \
	$(TEST_SCRIPT)

test-5-10:
	$(DOCKER_CMD) \
	swift:5.10.1 \
	$(TEST_SCRIPT)

test-6-0:
	$(DOCKER_CMD) \
	swift:6.0.3 \
	$(TEST_SCRIPT)

test-latest:
	$(DOCKER_CMD) \
	swift:latest \
	$(TEST_SCRIPT)


.PHONY: benchmarks format generate-variadics test
