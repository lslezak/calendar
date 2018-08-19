FROM opensuse:42.3
MAINTAINER Imobach González Sosa "igonzalezsosa@suse.com"

# see https://docs.docker.com/compose/rails/ for Rails examples

RUN zypper --non-interactive in --no-recommends gcc libxml2-devel \
  libxslt-devel make nodejs6 ruby2.2-devel ruby2.2-rubygem-bundler \
  postgresql96-devel && zypper clean -a

# install internal SUSE CA to access internal services via SSL
COPY docker/SUSE_CA_repo_key.pub .
RUN rpm --import SUSE_CA_repo_key.pub && rm SUSE_CA_repo_key.pub
COPY docker/ca-certificates-suse-1.0-5.1.noarch.rpm .
RUN rpm -i ca-certificates-suse-1.0-5.1.noarch.rpm && rm ca-certificates-suse-1.0-5.1.noarch.rpm

# Set Ruby 2.2 as the default version
RUN ln -sf /usr/bin/ruby.ruby2.2 /usr/local/bin/ruby

RUN mkdir -p /ydashboard/{app,vendor/bundle,www}
WORKDIR /ydashboard/app

EXPOSE 3000

COPY Gemfile /ydashboard/app/Gemfile
COPY Gemfile.lock /ydashboard/app/Gemfile.lock

# install dependencies
RUN bundle config --global build.nokogiri "--use-system-libraries"
RUN bundle config --global path "/ydashboard/vendor/bundle"
RUN bundle install -j 4

CMD bundle exec bin/rails s -p ${PORT:-3000} -b '0.0.0.0' -e ${RAILS_ENV:-development}

# add the application to the container as the last step so the previous steps
# can be cached and are not dropped when a file is changed
COPY . /ydashboard/app
