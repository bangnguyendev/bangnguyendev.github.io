FROM ruby:3.0

WORKDIR /srv/jekyll/

COPY Gemfile* ./

RUN bundle install

RUN gem install bundler && bundle install && gem install jekyll-paginate && gem install jekyll-sitemap && gem install jekyll-feed && gem install jekyll-seo-tag

ENTRYPOINT [ "jekyll" ]

VOLUME /srv/jekyll/

CMD ["serve"]