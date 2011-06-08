class Questions::FormaDropDownFieldNivel < Questions::SelectorField
  def self.friendly_name
    "Men� desplegable"
  end
  
  def options_for_select
    return [['Alto', 'Alto']] + [['Medio', 'Medio']] + [['Bajo', 'Bajo']] + super
  end
end