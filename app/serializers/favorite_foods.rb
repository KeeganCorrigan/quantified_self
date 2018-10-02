class FavoriteFoods < ActiveModel::Serializer
  :times_eaten, :foods

  def times_eaten
    binding.pry
  end

  def foods
    binding.pry
  end
end
