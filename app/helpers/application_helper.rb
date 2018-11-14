module ApplicationHelper
  def hours_class(number)
    if number > 10
      return "danger"
    end
  end

  def rating_class(number)
    if number
      if number > 4.5
        return "all-clear"
      elsif number < 3.9
        return "danger"
      end
    end
  end

  def price_class(number)
    if number < 1000
      return "all-clear"
    elsif number > 5000
      return "danger"
    end
  end
end
