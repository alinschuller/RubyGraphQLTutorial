require 'test_helper'

class Mutations::SignInUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Mutations::SignInUser.new(object: nil, context: { session: {} }).resolve(args)
  end

  def create_user
    User.create!(
      name: 'Test',
      email: 'test@test.com',
      password: '123456',
    )
  end

  test 'success' do
    user = create_user

    result = perform(
      email: {
        email: user.email,
        password: user.password
      }
    )

    assert result[:token].present?
    assert_equal result[:user], user
  end

  test 'failure due to no credentials' do
    assert_nil perform
  end

  test 'failure due to incorrect email' do
    create_user
    assert_nil perform(email: { email: 'incorrect@wrong.com' })
  end

  test 'failure due to incorrect password' do
    user = create_user
    assert_nil perform(email: { email: user.email, password: 'incorrect' })
  end
end
