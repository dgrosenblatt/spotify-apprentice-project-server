class SongDecorator < Draper::Decorator
  delegate_all

  def duration_in_minutes_and_seconds
    "#{duration / 60}:#{duration % 60}"
  end

  def full_title
    "#{song.artist.name} - #{song.title} - #{song.album}"
  end
end
