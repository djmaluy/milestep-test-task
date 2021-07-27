class TaskSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :description, :priority, :due_date, :is_done, :checked

end
