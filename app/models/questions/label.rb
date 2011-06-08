class Questions::Label < Question
  def self.friendly_name
    "Etiqueta de texto"
  end
  
  def caption
    cap = read_attribute :caption
    if cap.blank?
      "Pulse aquí para editar"
    else
      cap
    end
  end
end