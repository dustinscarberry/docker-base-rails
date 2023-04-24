#!/bin/sh

ruby31Version=ruby:3.1.4-alpine
ruby32Version=ruby:3.2.2-alpine

docker login

# build and push docker images

docker build -t dustinscarberry/rails-base:ruby3.1 --build-arg RUBY_VERSION=$ruby31Version -f images/Dockerfile .
docker push dustinscarberry/rails-base:ruby3.1

docker build -t dustinscarberry/rails-base:ruby3.2 --build-arg RUBY_VERSION=$ruby32Version -f images/Dockerfile .
docker push dustinscarberry/rails-base:ruby3.2
