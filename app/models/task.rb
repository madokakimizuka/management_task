class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 25 }
  validates :content, presence: true
  validates :deadline, presence: true
  validates :status, presence: true
  validates :status, presence: true

  belongs_to :user
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings, source: :label
  accepts_nested_attributes_for :labelings, allow_destroy: true

  enum status: %i( 未着手 着手中 完了 )
  enum priority: %i( 高 中 低 )

  scope :title_search, -> (params){ where(('title LIKE ?'), "%#{ params }%") }
  scope :status_search, -> (params){ where(('CAST(status AS TEXT) LIKE ?'), "%#{ params }%") }

  scope :paginate, ->(p) { page(p[:page]).per(20) }

  def self.sort_from_params(params)
    if params[:sort_expired].present?
      return Task.order(deadline: "DESC")
    elsif params[:sort_priority].present?
      return Task.order(:priority)
    else
      return Task.order(created_at: "DESC")
    end
  end
end
