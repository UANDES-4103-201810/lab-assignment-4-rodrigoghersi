class Event < ApplicationRecord
  belongs_to :place
  has_many :tickets  
   
  def start_date_after_created_at
      if self[:start_date] < Date.today
        errors.add :start_date, "must be after create date"
      end
  end  

  validate :start_date_after_created_at
  
end


