all:
	./configurator

playbook:
	ansible-playbook -i inventory --su-user="pi" playbook.yml

debug-playbook:
	ansible-playbook -v -i inventory --su-user="pi" playbook.yml

test: dependencies
	# @TODO - run docker retropie test

dependencies:
	apt-get install -y git ansible

changelog:
	$(eval TAG2 := $(shell git describe --tags --abbrev=0 2>/dev/null || echo "HEAD"))
	$(eval TAG1 := $(shell (git describe --tags --abbrev=0 $(TAG2)~1 2>/dev/null | xargs -I % echo %..) || echo ""))

	$(info Changelog for $(TAG1)$(TAG2):)
	$(info )
	@git log $(TAG1)$(TAG2) --no-merges --reverse --pretty=format:'- [view](https://github.com/andrewvaughan/retropie-configurator/commit/%H) &bull; %s'

clean: clean-container
	-find . -name '*.retry' -exec rm -f {} +
	-docker rmi andrewvaughan/retropie-configurator-test

clean-container:
	-docker stop retropie-configurator-test
	-docker rm retropie-configurator-test

.PHONY: all playbook test dependencies changelog clean clean-container
