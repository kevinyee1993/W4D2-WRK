class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: ['APPROVED', 'DENIED', 'PENDING']}
  validate :overlapping_requests

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    # debugger
    # cat = Cat.find(cat_id)
    cat.cat_rental_requests.each do |request|
      if self.start_date < request.end_date || self.end_date > request.start_date
        self.status = 'APPROVED'
      else
        self.status = 'DENIED'
        # self.errors
      end
    end

  end


end
