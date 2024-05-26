# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    author

    title { Faker::Book.title }
    number_of_copies { 25 }
    isbn { 9780743273563 }
    pages { 160 }
    published_at { '2003-01-01' }
  end
end
