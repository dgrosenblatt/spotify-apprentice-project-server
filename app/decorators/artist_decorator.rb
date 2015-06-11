class ArtistDecorator < Draper::Decorator
  delegate_all
  decorates_association :songs
end
