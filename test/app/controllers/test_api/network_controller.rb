class TestApi::NetworkController < TestApiController
  include RESTFramework::BaseControllerMixin

  self.extra_actions = {test: :get}

  def test
    return api_response({message: "Hello, this is your non-resourceful route!"})
  end
end
