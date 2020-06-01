class BoardCase 
  #DONE : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
  attr_accessor  :case_number, :content

  def initialize(case_number,content)
    @case_number = case_number
    @content = content

  end

end 