class Task < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :labels,through: :tags

  validates :title,   presence: true
  validates :content, presence: true, length:{ maximum:100}

  enum priority: { 高: 0, 中: 1, 低: 2 }

  scope :expired_sort , -> {order(expired: "DESC")}
  scope :priority_sort , -> {order(priority: "ASC")}
  scope :recent , -> {order(created_at: "DESC")}
  scope :search_status, -> (params){where(status: params) }
  scope :search_title, -> (params){where('title LIKE ?', "%#{params}%") }

  paginates_per 10

end

