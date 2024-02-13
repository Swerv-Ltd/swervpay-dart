publish:
	@echo "Publishing to pub.dev"
	@dart run build_runner build
	@dart pub publish --dry-run
	@dart pub publish
	@echo "Published to pub.dev"

build:
	@echo "Building code with build_runner"
	@dart run build_runner build
	@echo "Built"