
class API::V1::PumpkinsPresenter
  include ActiveModel::Serializers::JSON
  include ActiveModel::Serializers::Xml

  attr_reader :pumpkin

  def initialize(pumpkin = nil)
    @pumpkin = pumpkin || Pumpkin.new
  end

  def attributes
    {
      id: nil,
      name: nil, 
      weight: weight_in_kg, 
      softness: nil,
      farm: pumpkin.farm && pumpkin.farm.attributes.slice('name', 'city')
    }
  end

  def weight_in_kg
    (pumpkin.weight / 1000.0).round(2)
  end

  private
  def read_attribute_for_serialization(attribute)
    attributes[attribute] || pumpkin.read_attribute(attribute)
  end
end


  # def attributes=(hash)
  #   @pumpkin = Pumpkin.new(hash.slice('name', 'weight'))
  #   @pumpkin.farm = Farm.find_or_initialize_by(name: hash['farm_name']) if hash.key?('farm_name')
  # end

