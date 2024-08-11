site:
	Rscript --quiet -e "blogdown::build_site()"

deploy:
	make site && \
	cd public && tar czf - * | ssh git@bio-spring.top tar xzfC - /var/www/html/bio-spring.top/

clean:
	rm -rf public

pages:
	Rscript --quiet -e "blogdown::build_site(baseURL='https://gaospecial.github.io/bio-spring/')"; \
	cd gh-pages && git rm -r * && cp -r ../public/* . && git add --all && git commit -m "update site" && git push

