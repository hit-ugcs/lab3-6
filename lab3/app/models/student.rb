class Student < ActiveRecord::Base
  attr_accessible :final, :final_test, :lab, :name, :nick_name, :number, :project, :talking
  validates :number, :presence => true,
                     :uniqueness => true,
                     :length => {is:10}
  validates :name, :presence => true,
                   :length => {:maximum =>10}
  validates :nick_name, :presence => true,
                        :length => {:maximum =>10}
  validates_numericality_of :project, :final_test, :lab, :talking, :only_integer =>true
  validates_presence_of :project, :final_test, :lab, :talking
  def judge_value
     if project<0 or project>40
       errors.add(:project,"Must be 0-40!")
     end 
     if final_test<0 or final_test>40
       errors.add(:final_test,"Must be 0-40!")
     end
     if lab<0 or lab>10
       errors.add(:lab,"Must be 0-10!")
     end
     if talking<0 or talking>10
       errors.add(:talking,"Must be 0-10!")
     end
  end
  def final
    project+final_test+lab+talking
  end
  validate :judge_value, :final
end
