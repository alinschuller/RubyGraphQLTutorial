class Vote < ActiveRecord::Base
  belongs_to :link, validate: true
  belongs_to :user, validate: true
end
