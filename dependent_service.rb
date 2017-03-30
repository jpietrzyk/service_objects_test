class DependentService
  include ServiceBehavior

  def initialize
    @decision = (Time.now.to_i. % 2).eql?(0)
  end

  def process!(params)
    @params = params

    do_stuff
  end

  private

  attr_accessor :decision, :params

  def do_stuff
    return @decision ? succeed!('Hurray') : fail!('Ouch')
  end

end
