class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 25 }
  validates :content, presence: true

  def self.sort_from_params(params)
    if params[:sort_expired].present?
      return Task.order(deadline: "DESC")
    else
      return Task.order(created_at: "DESC")
    end
  end
end
