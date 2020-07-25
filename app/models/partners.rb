class Partners < ApplicationRecord
    belongs_to :users
    belongs_to :training
end
