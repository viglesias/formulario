class Questions::FormaHeadingTitle < Question
  def self.friendly_name
    "Cabecera secci—n"
  end
  
  def caption
    cap = read_attribute :caption
    if cap.blank?
      "Pulsa aqu’ para escribir."
    else
      cap
    end
  end
end