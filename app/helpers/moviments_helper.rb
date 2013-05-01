module MovimentsHelper
  def expenses_sum(objects)
    (-1) * objects.map { |object|
      object.expense? ? object.value : 0
    }.sum
  end

  def revenues_sum(objects)
    objects.map { |object|
      object.revenue? ? object.value : 0
    }.sum
  end
end
