module EducationHelper
  def options_for_ngos ngos
    ngos.collect{|ngo| [ngo.name,ngo.id]}
  end
end
