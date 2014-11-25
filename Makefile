.PHONY: npm all test

NPM_UP_TO_DATE:=.npm-up-to-date
NODE=node

all: test

npm: $(NPM_UP_TO_DATE)

$(NPM_UP_TO_DATE): package.json
	npm install
	touch $(NPM_UP_TO_DATE)

test-suite: npm
	$(NODE) tests/test-suite.js

unit-tests: npm
	$(NODE) tests/test-node-unit.js

timing-tests: npm
	$(NODE) tests/test-node.js

dormann-test: npm
	$(NODE) tests/test-dormann.js

short-tests: unit-tests timing-tests dormann-test
long-tests: test-suite 

dist: npm
	@rm -rf out/build out/dist
	@mkdir -p out/dist
	@mkdir -p out/build
	cp -r *.js *.css *.html *.txt *.ico discs tapes images lib roms out/build
	m4 -DDEPLOY_DIR=$(shell pwd)/out/dist '-DCOMMON_SETTINGS=$(shell $(NODE) -e 'requirejs = {config: function(c) { c.baseUrl = "."; console.log(JSON.stringify(c)); }}; require("./requirejs-common.js");' | sed 's/^.\(.*\).$$/\1/')' build.js.template > out/build.js
	cd out/build && $(shell pwd)/node_modules/requirejs/bin/r.js -o ../build.js

clean:
	@rm -rf out

spotless: clean
	@rm -f $(NPM_UP_TO_DATE)

test: short-tests long-tests

.PHONY: test short-tests test dormann-test timing-tests unit-tests test-suite npm 
.PHONY: all dist clean spotless
