#!/bin/sh

ruby31Version=ruby:3.1.2-alpine

docker login

# build and push docker images

docker build -t dustinscarberry/rails-base:ruby3.1 --build-arg RUBY_VERSION=$ruby31Version -f images/Dockerfile .
docker push dustinscarberry/rails-base:ruby3.1
