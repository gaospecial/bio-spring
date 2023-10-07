site:
	Rscript --quiet -e "blogdown::build_site(baseURL = 'https://bio-spring.top')"

deploy:
	make site
	cd public && tar czf - * | ssh www-data@bio-spring.top tar xzfC - /var/www/html/bio-spring.top/

clean:
	rm -rf public
