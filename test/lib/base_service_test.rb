# frozen_string_literal: true

require_relative "../test_helper"

class BaseServiceTest < ActiveSupport::TestCase
  setup do
    @base_service = BaseService.new
  end

  context '#call' do
    should 'should raise runtime error when called with no args' do
      assert_raises(RuntimeError) { @base_service.call }
    end
  end
end
