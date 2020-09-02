class Partner < ApplicationRecord
    validates :user_id, uniqueness: { scope: :training_id }

    belongs_to :user
    belongs_to :training

    scope :upcoming, ->{order(created_at: :desc ) }

    def self.upcoming2(user_id)
        if user_id
          where(user_id: user_id)
        end
    end
end
