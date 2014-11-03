
class API::ArrayPresenter
  include Enumerable
  attr_reader :objects
  delegate :each, to: :objects
  delegate :to_xml, to: :to_a

  def initialize(objects, presenter)
    @objects = objects.map {|object| presenter.new(object) }
  end
end

