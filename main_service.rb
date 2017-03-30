class MainService
  include ServiceBehavior

  def initialize
    @dependent_service = dependent_service || DependentService.new
  end

  def process!(params)
    @params = params
    dependent_result = make_dependent_stuff

    on dependent_result.success? do
      result = make_your_own_stuff

      on result.success? do return result end
      on result.failure? do
        do_some_things_on_fail
        return result
      end
    end

    on dependent_result.failure? do
      return Result.new(status: :failure,
        message: "Dependent service fails with message: #{ dependent_result.message }")
    end
  end

  private

  attr_reader :dependent_service, :params

  def make_your_own_stuff
    return Result.new(status: :success,
      message: 'Successfully made my job!')
  end

  def make_dependent_stuff
    @dependent_service.process!(@params)
  end

  def do_some_things_on_fail
    # things should do when failing
  end
end
