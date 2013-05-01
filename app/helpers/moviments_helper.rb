module MovimentsHelper
  def expenses_sum(objects)
    (-1) * objects.sum { |object|
      object.expense? ? object.value : 0
    }
  end

  def revenues_sum(objects)
    objects.sum { |object|
      object.revenue? ? object.value : 0
    }
  end
end
