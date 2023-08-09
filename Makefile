site:
	Rscript --quiet -e "blogdown::build_site()"

deploy:
	scp -rpq public/* root@bio-spring.top:/var/www/html/bio-spring.top

deploy2:
	make site
	cd public && tar czf - * | ssh root@bio-spring.top tar xzfC - /var/www/html/bio-spring.top/

clean:
	rm -rf public
