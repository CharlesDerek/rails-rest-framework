require_relative "base"

class TestApi::ReadOnlyThingsControllerTest < ActionController::TestCase
  include BaseTestApiControllerTests

  def test_list
    get(:index, as: :json)
    assert_response(:success)
    assert(@response.parsed_body[0]["name"])
    assert(@response.parsed_body[0]["owner"])
    refute(@response.parsed_body[0]["calculated_property"])
  end

  def test_show
    t = Thing.create!(name: "test", owner_attributes: {login: "test"})
    get(:show, as: :json, params: {id: t.id})
    assert_response(:success)
    assert(@response.parsed_body["owner"])
    assert_in_delta(@response.parsed_body["calculated_property"], 9.234, 0.01)
  end
end
