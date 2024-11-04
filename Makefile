site:
	Rscript --quiet -e "blogdown::build_site()"

clean:
	rm -rf public
