class Task < ApplicationRecord
  validates :title,   presence: true
  validates :content, presence: true, length:{ maximum:100}

  enum priority: { 高: 0, 中: 1, 低: 2 }

  scope :expired , -> {order(sort_expired: "DESC")}
  scope :recent , -> {order(created_at: "DESC")}
  scope :search_title , -> (params) {where('(title LIKE?)',"%#{ params.dig(:task, :title)}%" )}
  scope :search_status , -> (params) {where('(status LIKE?)',"%#{ params.dig(:task, :status) }%" )}

end