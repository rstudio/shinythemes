HTML_FILES = index.html

SCREENSHOT_FILES = images/cerulean.png \
				   images/default.png \
				   images/journal.png \
				   images/spacelab.png \
				   images/cosmo.png \
				   images/flatly.png \
				   images/readable.png \
				   images/united.png


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
