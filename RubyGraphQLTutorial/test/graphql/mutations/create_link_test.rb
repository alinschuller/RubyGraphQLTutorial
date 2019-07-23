require 'test_helper'

class Mutations::CreateLinkTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateLink.new(object: nil, context: {}).resolve(args)
  end

  test 'create a new link' do
    link = perform(
      url: 'http://examplefortest.com',
      description: 'description test',
    )

    assert link.persisted?
    assert_equal link.description, 'description test'
    assert_equal link.url, 'http://examplefortest.com'
  end
end
