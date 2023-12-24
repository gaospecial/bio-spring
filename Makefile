site:
	Rscript --quiet -e "blogdown::build_site()"

deploy:
	make site
	cd public && tar czf - * | ssh git@bio-spring.top tar xzfC - /var/www/html/bio-spring.top/

clean:
	rm -rf public
