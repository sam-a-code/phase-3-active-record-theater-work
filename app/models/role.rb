class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    auditions.map { |a| a.actor}
  end

  def locations
    auditions.map { |a| a.location}
  end

  def lead
    auditions.find_by(hired: true)
    if auditions.find_by(hired: false)
      "No actor has been hired for this role"
    end
  end

  def understudy
    auditions.find_by(hired: true).second
    if auditions.find_by(hired: false).second
      "No actor has been hired for this role"
    end
  end
end
