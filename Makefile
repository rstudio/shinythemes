HTML_FILES = index.html

SCREENSHOT_FILES = images/default.png \
				   images/cerulean.png \
				   images/cosmo.png \
				   images/darkly.png \
				   images/flatly.png \
				   images/journal.png \
				   images/lumen.png \
				   images/paper.png \
				   images/readable.png \
				   images/sandstone.png \
				   images/simplex.png \
				   images/slate.png \
				   images/spacelab.png \
				   images/superhero.png \
				   images/united.png \
				   images/yeti.png


all: html screenshots

html: $(HTML_FILES)

%.html: %.Rmd
	R --slave -e "rmarkdown::render('$<')"

screenshots: $(SCREENSHOT_FILES)

$(SCREENSHOT_FILES): tools/make_screenshots.R
	tools/make_screenshots.R

.PHONY: clean
clean:
	$(RM) $(HTML_FILES)
	$(RM) -rf libs
