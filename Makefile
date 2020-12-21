PLATFORM_IOS = iOS Simulator,name=iPhone 11 Pro Max
PLATFORM_MACOS = macOS
PLATFORM_TVOS = tvOS Simulator,name=Apple TV 4K (at 1080p)

default: test

test:
	xcodebuild test \
		-scheme Parsing \
		-destination platform="$(PLATFORM_IOS)"
	xcodebuild test \
		-scheme Parsing \
		-destination platform="$(PLATFORM_MACOS)"
	xcodebuild test \
		-scheme Parsing \
		-destination platform="$(PLATFORM_TVOS)"

format:
	swift format --in-place --recursive \
		./Examples ./Package.swift ./Sources ./Tests

.PHONY: format test-all test-swift test-workspace
