class Cat < ApplicationRecord

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :sex, inclusion: {in: ['M','F']}
  validates :color, inclusion: {in: ['black', 'white', 'tabby', 'orange']}


  def age
    Time.now.year - birth_date.year
  end


end
