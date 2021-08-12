class Task < ApplicationRecord
  belongs_to :user

  validates :priority, numericality: true, presence: true
  validates :title, :description, length: { in: 2..100 }, presence: true

  has_one_attached :attachment

  has_and_belongs_to_many :categories

  def attachment_url
    if attachment.attached?
      S3_BUCKET.object(attachment.key).public_url
    end
  end

end
