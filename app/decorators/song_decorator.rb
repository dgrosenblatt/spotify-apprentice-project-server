class SongDecorator < Draper::Decorator
  delegate_all

  def formatted_duration
    "#{duration / 60}:#{duration % 60}"
  end

  def full_title
    "#{artist.name} - #{title} - #{album}"
  end
end
