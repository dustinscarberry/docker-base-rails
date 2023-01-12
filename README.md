# Ruby on Rails Base Docker Image

## Current variants

### Ruby3.x

Base box with nginx / puma.

## Usage

```docker
FROM dustinscarberry/rails-base:ruby3.2

# install app files
WORKDIR /app
COPY . .
RUN bundle install

EXPOSE 80

## Building / updating base boxes

```sh
./build.sh
```
