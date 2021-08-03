class TaskSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :description, :priority, :due_date, :is_done, :checked, :some_file

  def some_file
    if object.some_file.attached?
      {
        pdf: rails_blob_url(object.some_file)
      }
    end
  end

end
