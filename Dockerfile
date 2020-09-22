FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /myapp
WORKDIR /myapp

WORKDIR /myapp
ADD ./ /myapp
RUN bundle install
# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE  3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]