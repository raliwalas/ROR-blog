class BlogPost < ApplicationRecord
    # ensure that the new title and the new body are not empty
    validates :title, presence: true
    validates :body, presence: true
end
