FROM ruby:2.5.3

RUN apt-get update -qq && apt-get install -y postgresql-client

RUN mkdir /iSale_backend
WORKDIR /iSale_backend
COPY Gemfile* /iSale_backend/
RUN gem install bundler
RUN bundle install
COPY . /iSale_backend

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
