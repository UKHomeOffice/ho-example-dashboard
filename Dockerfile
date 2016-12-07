FROM quay.io/ukhomeofficedigital/ruby:v2.3.3

USER app
EXPOSE 3030
CMD ["bundle", "exec", "smashing", "start"]
