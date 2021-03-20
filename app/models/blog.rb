class Blog < ApplicationRecord
    validates :title, presence:true
    validates :author, presence:true
    validates :content, presence:true
    validates :likes, presence:true
    validates :shares, presence:true
end
