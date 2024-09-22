class Notice < ApplicationRecord

  def self.active_notices(area_id)
    now = DateTime.current
    Notice.where("notices.area_id = ? AND (notices.start_datetime <= ? AND notices.end_datetime >= ? OR (notices.start_datetime <= ? AND notices.end_datetime IS NULL ))", area_id, now, now, now)
  end

  def self.expired_notices(area_id)
    now = DateTime.current
    Notice.where("notices.area_id = ? AND (notices.end_datetime IS NOT NULL AND notices.end_datetime < ?)", area_id, now)
  end


  def self.upcoming_notices(area_id)
    now = DateTime.current
    Notice.where("notices.area_id = ? AND (notices.start_datetime > ?)", area_id, now)
  end

  def is_expired?
    (self.end_datetime != nil) && (self.end_datetime.before? DateTime.current)
  end


end