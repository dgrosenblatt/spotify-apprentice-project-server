class SongDecorator < Draper::Decorator
  delegate_all

  def formatted_duration
    "#{duration / 60}:#{duration % 60}"
  end

  def full_title
    "#{song.artist.name} - #{song.title} - #{song.album}"
  end
end
