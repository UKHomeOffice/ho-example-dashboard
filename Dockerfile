FROM quay.io/ukhomeofficedigital/centos-base
ONBUILD RUN yum clean all && yum update -y && yum clean all && rpm --rebuilddb

RUN yum install -y wget make bzip2 gcc-c++

#   Get GPG key
RUN wget https://raw.github.com/postmodern/postmodern.github.io/master/postmodern.asc && \
    gpg --import postmodern.asc && \
    wget https://raw.github.com/postmodern/ruby-install/master/pkg/ruby-install-0.6.0.tar.gz.asc && \
#   Download ruby-install and verify against the GPG key
    wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz && \
    gpg --verify ruby-install-0.6.0.tar.gz.asc ruby-install-0.6.0.tar.gz && \
    tar -xzvf ruby-install-0.6.0.tar.gz && cd ruby-install-0.6.0 && make install && \
#    Install Ruby
    ruby-install --system ruby 2.2.6

RUN gem install bundler
WORKDIR /app
ADD ./Gemfile /app
RUN bundle install
ADD . /app

EXPOSE 3030
CMD ["bundle", "exec", "smashing", "start"]