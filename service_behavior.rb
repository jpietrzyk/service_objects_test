module ServiceBehavior
  def on(status)
    yield if status
  end

  private

  def succeed!(message = 'Operation succeed')
    Result.new(status: :success, message: message)
  end

  def fail!(message = 'Operation failed')
    Result.new(status: :failed, message: message)
  end
end
