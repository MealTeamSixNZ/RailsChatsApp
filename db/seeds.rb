["Auckland", "Queenstown", "Wellington"].each do |name|
  Area.find_or_create_by!(name: name)
end

# todo: add unique trait to emails for driver and staff table as migration to avoid duplicates
[["driver1@driver.com", Area.find_by_name("Auckland").id],
 ["driver2@driver.com", Area.find_by_name("Queenstown").id],
 ["driver3@driver.com", Area.find_by_name("Wellington").id]].each do |email, area_id|
  Driver.find_or_create_by!(email: email) do |driver|
    driver.area_id = area_id
    driver.password = "password"
  end
end

[["dispatcher@staff.com", "Dispatcher"], ["areacoordinator@staff.com", "Area Coordinator"]].each do |email, staff_type|
  Staff.find_or_create_by!(email: email) do |staff|
    staff.staff_type = staff_type
    staff.password = "password"
  end
end

["driver1@driver.com", "driver2@driver.com", "driver3@driver.com"].each do |driver_email|
  driver_id = Driver.find_by_email(driver_email).id
  ["Area Coordinator", "Dispatcher"].each do |staff_type|
    message = Message.new(content: "message from #{driver_email} to #{staff_type}", driver_id: driver_id, message_type: staff_type)
    message.save!
  end
end

["dispatcher@staff.com", "areacoordinator@staff.com"].each do |staff_email|
  staff_id = Staff.find_by_email(staff_email).id
  staff_type = Staff.find_by_email(staff_email).staff_type
  ["driver1@driver.com", "driver2@driver.com", "driver3@driver.com"].each do |driver_email|
    driver_id = Driver.find_by_email(driver_email).id
    message = Message.new(content: "message from #{staff_email} to #{driver_email}", driver_id: driver_id, staff_id: staff_id,  message_type: staff_type)
    message.save!
  end
end

[["Current notice", "This notice should be active, showing to all staff and drivers", DateTime.current, DateTime.current + 1.year],
 ["Upcoming notice", "This notice shouldn't be active, only showing to staff", DateTime.current + 1.day, DateTime.current + 1.year],
 ["Expired notice", "This notice should be expired, only showing to staff", DateTime.current - 1.year, DateTime.current - 1.day]]
  .each do |title, content, start_datetime, end_datetime|
  notice = Notice.new(title: title, content: content, start_datetime: start_datetime, end_datetime: end_datetime)
  notice.save!
end