.PHONY: path
install-local-bin:
	./installers/install-local-bin.sh

.PHONY: install-configs
install-configs:
	./installers/install-configs.sh

.PHONY: install-all
install-all:
	./installers/install-all.sh

.PHONY: pull-master
pull-master:
	git pull --ff origin master

.PHONY: update
update: pull-master install-all

.PHONY: clone-private
clone-private:
	git clone git@github.com:surajssd/dotfilesprivate.git