FROM ubuntu:20.04

# Update, install NodeJS and NPM, clone RanvierMUD
RUN apt-get update && \
    apt-get upgrade && \
    apt-get install -y nodejs && \
    apt-get install -y npm && \
    apt-get install -y git
RUN git clone https://github.com/RanvierMUD/ranviermud.git

# Setting up RanvierMUD
WORKDIR ranviermud
RUN npm ci
RUN npm run init
RUN (echo "Y" | npm run init)
EXPOSE 4000
CMD ["./ranvier"]
