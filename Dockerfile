# Use the official Ruby image as a parent image
FROM ruby:3.2.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory
WORKDIR /library_api

# Copy the Gemfile and Gemfile.lock
COPY Gemfile* ./

# Install the Rails dependencies
RUN gem install bundler && bundle install

# Copy the rest of the application code
COPY . .

# Expose port 3000 to the Docker host
EXPOSE 3000

# Set the Rails environment
ENV RAILS_ENV=development
ENV RAILS_LOG_TO_STDOUT true

# Start the Rails server using Puma
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
