require 'factory_girl'

FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "#{n}: Cupcake ipsum dolor sit amet? Who the heck knows what the even means. Nobody." }
    sequence(:description) { |d| "Just do it #{d}. This is not a long enough descrption so I have to add these extra characters in order to pass my validations. Really hope this is long enough now. Why are all of my tests still failing? I really have no idea. Still not sure why this is not working." }
  end
end
