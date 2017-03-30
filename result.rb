Result = ImmutableStruct.new(:status, :message) do
  def success?
    status.eql? :success
  end

  def failure?
    !success?
  end
end
