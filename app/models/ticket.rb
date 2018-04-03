class Ticket < ApplicationRecord
  belongs_to :event
  has_many :user_tickets
  has_many :users, through: :user_tickets
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def creation_date_cant_be_after_event_starts
    if  event.start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end 

  validate :creation_date_cant_be_after_event_starts


end


  
