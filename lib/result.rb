# frozen_string_literal: true

# @param error [Any] added to the errors array
# @param message [Any] (likey a String) added to the messages array
# @param data [Any] set as the data attribute
# @return [Result] success|valid?|failure|errors|messages|data
#
class Result
  def initialize(error: nil, message: nil, data: nil)
    add_error(error) if error.present?
    add_message(message) if message.present?
    @data = data
  end

  attr_accessor :data

  def valid?
    errors.empty?
  end

  alias success valid?

  def failure
    !success
  end

  def errors
    @errors ||= []
  end

  def messages
    @messages ||= []
  end

  def add_error(error)
    errors << error
    self
  end

  def add_message(message)
    messages << message
    self
  end

  def add_errors(new_errors)
    new_errors.each { |e| add_error(e) }
    self
  end

  def add_messages(new_messages)
    new_messages.each { |m| add_message(m) }
    self
  end

  def to_h
    {
      valid: valid?,
      errors: errors,
      messages: messages,
      data: data
    }
  end
end
