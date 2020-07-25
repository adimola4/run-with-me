class Training < ApplicationRecord
  belongs_to :user
  #belongs_to :partners

  scope :published, -> { where(:published => true)}
  scope :ordered_by_most_recent, ->{order(created_at: :desc)}
  

 # handle status
 enum status: [:open, :full, :complete, :canceled]
#  def status
#   @status ||= TrainingStatus.new(read_attribute(:status))
#  end  

  # Ex:- scope :active, -> {where(:active => true)}
end
