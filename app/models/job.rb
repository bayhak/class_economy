# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string(255)
#  description :string(255)
#  salary      :float
#  group_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  attr_accessible :description, :salary, :title

  #Valadations

  validates :user_id, :group_id, :presence => true
  validates :title, :description, :presence => true, length: { maximum: 255 }
  validates :salary, :presence => true, numericality: { greater_than: 0.0 }

end