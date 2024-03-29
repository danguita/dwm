SUBMODULE_PATH="dwm"

.PHONY: deploy
deploy: clean update apply install

.PHONY: clean
clean:
	git submodule deinit --force ${SUBMODULE_PATH}

.PHONY: update
update:
	git submodule update --init

.PHONY: apply
apply:
	git apply --directory=${SUBMODULE_PATH} patches/*.diff

.PHONY: install
install:
	sudo make -C ${SUBMODULE_PATH} clean install
