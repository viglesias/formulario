class Questions::DropDownField < Questions::SelectorField
  def self.friendly_name
    "Menú desplegable"
  end
  
  def options_for_select
    return [['', '']] + super
  end
end