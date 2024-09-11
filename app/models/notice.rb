class Notice < ApplicationRecord

  def self.active_notices
    Notice.all #placeholder
  end
  def self.expired_notices
    Notice.where("notices.end_date < ? or (notices.end_date = ? and notices.end_time < ?)", Date.current, Date.current, Time.current)
  end

  def self.upcoming_notices
    Notice.all #placeholder
  end
end
