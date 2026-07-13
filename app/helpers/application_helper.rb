module ApplicationHelper
  def card_stage_class(list_name)
    case list_name.to_s.downcase
    when "fazendo"
      "card-item--pending"
    when "concluído", "concluido"
      "card-item--done"
    else
      ""
    end
  end
end
