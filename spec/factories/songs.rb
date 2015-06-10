FactoryGirl.define do
  factory :song do
    sequence(:title) { |n| "2 + 2 = #{n}" }
    artist 'Radiohead'
    album 'Hail to the Thief'
    duration 325
    spotify_uri { SecureRandom.hex(10) }
  end
end
