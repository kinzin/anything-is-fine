class Gift < ActiveRecord::Base
  attr_accessible :name, :price, :website, :taken
end
