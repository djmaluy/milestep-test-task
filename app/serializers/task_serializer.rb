class TaskSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :description, :priority, :due_date, :is_done, :checked, :attachment

  def attachment
    if object.attachment.attached?
      {
        pdf: rails_blob_url(object.attachment)
      }
    end
  end

end
