FROM quay.io/ukhomeofficedigital/ruby

USER app
EXPOSE 3030
CMD ["bundle", "exec", "smashing", "start"]
