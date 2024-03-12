# frozen_string_literal: true

require_relative "../test_helper"

class ResultTest < ActiveSupport::TestCase
  setup do
    @result = Result.new
  end

  context '#new' do
    should 'allow initial values' do
      result = Result.new(error: 'my error')
      assert_equal(['my error'], result.errors)
    end
  end

  context '#valid?' do
    context 'has no errors' do
      should 'return true' do
        assert_equal true, @result.valid?
      end
    end

    context 'has errors' do
      should 'return false' do
        @result.add_error("womp womp")
        assert_equal false, @result.valid?
      end
    end
  end

  context '#add_error' do
    should 'allow users to add error' do
      error = 'test error'
      @result.add_error(error)
      assert_equal 1, @result.errors.length
      assert_equal error, @result.errors.last
    end
  end

  context '#add_message' do
    should 'allow users to add message' do
      message = 'test message'
      @result.add_message(message)
      assert_equal 1, @result.messages.length
      assert_equal message, @result.messages.last
    end
  end

  context '#add_errors' do
    should 'allow adding more than one error' do
      errors = %w[one two three]
      @result.add_errors(errors)
      assert_equal(3, @result.errors.length)
      assert_equal(%w[one two three], @result.errors)
    end
  end

  context '#to_h' do
    setup do
      @result.add_error('boom')
      @result.add_message('sorry something went boom')
    end

    should 'serialize to a hash' do
      serialized = @result.to_h
      assert_equal(['boom'], serialized[:errors])
      assert_equal(['sorry something went boom'], serialized[:messages])
      assert_equal(false, serialized[:valid])
      assert(serialized.keys.include?(:data))
    end
  end
end
