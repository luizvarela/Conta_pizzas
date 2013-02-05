class Employee < ActiveRecord::Base
  attr_accessible :name, :faults_number

  # def self.search(keywords)
  #   employees = order(:name)
  #   employees = employees.where("name like ?", "%#{keywords}%") if keywords.present?
  #   employees
  # end

 def self.search(search)
   if search
    where('name LIKE ?', "%#{search}%")
   else
    scoped
   end
 end

end
