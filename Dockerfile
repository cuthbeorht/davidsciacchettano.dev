FROM jekyll/jekyll

WORKDIR /srv/jekyll

COPY . .

CMD ['jekyll', 'serve']