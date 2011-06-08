class Questions::FormaLabel < Question
  def self.friendly_name
    "Etiqueta de texto"
  end
  
  def caption
    cap = read_attribute :caption
    if cap.blank?
      "Pulse aqu’ para editar"
    else
      cap
    end
  end
end