class Consultora < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:trackable, :timeoutable, :lockable
  scope :existe ,-> (proyecto) {where("email = ?", proyecto)} 
end
