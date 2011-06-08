class Questions::FormaDropDownFieldMod < Questions::SelectorField
  def self.friendly_name
    "Men� desplegable"
  end
  
  def options_for_select
    return [['Presencial', 'Presencial']] + [['Elearning', 'Elearning']] + [['Mixtos', 'Mixtos']] + super
  end
end