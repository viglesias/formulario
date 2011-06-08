class Questions::Heading < Question
  def self.friendly_name
    "Cabecera"
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