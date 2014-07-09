class Employee < ActiveRecord::Base
  attr_accessible :age, :department, :designation, :email_id, :location, :name, :soft_deleted
  
  scope :search, ->(keyword) {where("name LIKE '%#{keyword}%' or location LIKE '%#{keyword}%' or email_id LIKE '%#{keyword}%' or designation LIKE '%#{keyword}%' or department LIKE '%#{keyword}%' or age LIKE '%#{keyword}%'")}
  
  validates :name, :age, :department, :designation, :email_id, :location, presence: true
  
end
