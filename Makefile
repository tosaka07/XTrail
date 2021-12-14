PRODUCT_NAME = XTrail
EXECUTABLE_NAME = xtrail

PREFIX? = /usr/local
INSTALL_PATH = $(PREFIX)/bin/$(EXECUTABLE_NAME)

.PHONY: generate
generate:
	@swift package generate-xcodeproj

.PHONY: build-debug
build-debug:
	@swift build

.PHONY: build
build:
	@swift build -c release --disable-sandbox

.PHONY: install
install: build
	@mkdir -p "$(PREFIX)/bin"
	@cp -f ".build/release/$(EXECUTABLE_NAME)" $(INSTALL_PATH)
