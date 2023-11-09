class Article < ApplicationRecord
  extend FriendlyId
    friendly_id :title 
    include Visible

    

    has_many :comments, dependent: :destroy
  
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 5 }

    
  end
  