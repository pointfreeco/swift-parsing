PLATFORM_IOS = iOS Simulator,name=iPhone 11 Pro
PLATFORM_MACOS = macOS
PLATFORM_TVOS = tvOS Simulator,name=Apple TV 4K (at 1080p)

default: test

benchmarks:
	swift run -c release swift-parsing-benchmark

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
		./Package.swift ./Sources ./Tests

generate-variadics:
	swift run variadics-generator \
		--generate-zips \
		--generate-one-ofs \
		> Sources/Parsing/ParserBuilder/Variadics.swift
	swift run variadics-generator \
		--generate-path-zips \
		> Sources/URLRouting/PathBuilder/Variadics.swift

.PHONY: format generate-variadics test-all test-swift test-workspace
