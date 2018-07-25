# json.extract! @employee, :id, :title, :created_at, :updated_at
# json.url post_url(@employee, format: :json)
json.partial! "employees/employee", employee: @employee
