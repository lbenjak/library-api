# frozen_string_literal: true

FactoryBot.define do
  factory :rating do
    score { 5 }
    review { 'Great book!' }
    user
    book
  end
end
