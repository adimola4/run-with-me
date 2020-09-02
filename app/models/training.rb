class Training < ApplicationRecord
  belongs_to :user
  

  scope :public?, -> { where(:public => true)}
  scope :ordered_by_most_recent, ->(limit:10){order(created_at: :desc ) }
  scope :upcoming, -> { where.not(:status => "canceled").or(where.not(:status => "complete"))}
  has_many :partners, dependent: :destroy

  

  def self.search(search)
    if search
      where(["zipcode LIKE ?" , "%#{search}%"])
    else
      all
    end
  end

  #def self.upcoming()
   # if user_id
    #  where(user_id: user_id)
   # end
  #end


 # handle status
 enum status: [:open, :full, :complete, :canceled]
#  def status
#   @status ||= TrainingStatus.new(read_attribute(:status))
#  end  

  # Ex:- scope :active, -> {where(:active => true)}
end
