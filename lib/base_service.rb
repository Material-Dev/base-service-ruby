# frozen_string_literal: true

# just a little base class that other services can inherit from
# with the benefit that all services are similar.
# Calling a service looks like: MyService.call(opt1: "foo", opt2: "bar")
# @return [Result]
#
class BaseService
  def self.call(...)
    new(...).call
  end

  def initialize(...)
    # if your class has ivars that need to be set from the args
    # then you should override this in your class.  ie
    # def initialize(:opt1, :opt2)
    #   @opt1 = opt1
    #   @opt2 = opt2
    # end
  end

  def call
    execute
    result
  end

  def execute
    raise NotImplementedError, 'You must implement this method.'
  end

  private

  def result
    @result ||= Result.new
  end
end
