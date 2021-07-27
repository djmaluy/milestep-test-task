class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :first_name, :last_name, :email, :email_confirmed, :phone, :address, :image




  def image
    if object.image.attached?
      {
        url: rails_blob_url(object.image)
      }
    end
  end
end
