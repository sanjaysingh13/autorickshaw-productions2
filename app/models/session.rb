class Session < ActiveRecord::Base
  has_no_table

  column :password, :string
  
  validates_presence_of :password
  
  validates_length_of :password, :maximum => 50

  
end
