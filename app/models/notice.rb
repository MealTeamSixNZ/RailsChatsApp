class Notice < ApplicationRecord

  def self.active_notices
    now = DateTime.current
    Notice.where("notices.start_datetime <= ? AND notices.end_datetime >= ? OR (notices.start_datetime <= ? AND notices.end_datetime IS NULL )", now, now, now)
  end

  def self.expired_notices
    now = DateTime.current
    Notice.where("notices.end_datetime IS NOT NULL AND notices.end_datetime < ?", now)
  end


  def self.upcoming_notices
    now = DateTime.current
    Notice.where("notices.start_datetime > ?", now)
  end

  def is_expired?
    (@end_datetime != nil) && (@end_datetime.before? DateTime.current)
  end
end
