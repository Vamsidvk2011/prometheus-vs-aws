.PHONY: all clean bundle unbundle

all: $(patsubst %.asc,%.html,$(wildcard *.asc))

%.html: %.asc
	bundle exec asciidoctor-revealjs $(<)

clean:
	rm -f *.html

bundle:
	bundle install --path .bundle
	curl -sSL https://github.com/hakimel/reveal.js/archive/3.5.0.tar.gz | tar -xz && mv reveal.js-*.*.* reveal.js

unbundle:
	rm -rf .bundle reveal.js
