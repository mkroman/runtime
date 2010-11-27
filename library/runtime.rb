# encoding: utf-8

require 'date'
require 'runtime/pool'
require 'runtime/event'
require 'runtime/manager'
require 'runtime/extensions'

module Runtime
  class DuplicateInstance < StandardError; end

  class << Version = [1,0]
    def to_s; join '.' end
  end

module_function

  def enabled?; not $_runtime.nil? end

  def enable
    if $_runtime.nil?
      $_runtime = Manager.new
    else
      raise DuplicateInstance, 'Runtime is already running'
    end
  end

  def in time, *args, &block
    raise ArgumentError, 'The _in method demands a block!' and return unless block_given?

    event = case time
            when Time
              Event.new time.to_i, *args, &block
            when Fixnum
              Event.new Time.now.to_i + time, *args, &block
            end

    $_runtime.add_event event
  end

  def at time, *args, &block
    raise ArgumentError, 'The at method demands a block!' and return unless block_given?

    event = case time
            when String # FIXME
              Event.new DateTime.parse(time).to_time.to_i, *args, &block
            when Time
              Event.new time.to_i, *args, &block
            end

    $_runtime.add_event event
  end
end

def _in *args, &block; Runtime.in *args, &block end
def at  *args, &block; Runtime.at *args, &block end

# WHY, RUBY.. WHY ;_;!?
alias :in_  :_in
alias :_in_ :_in

Runtime.enable unless $NO_RUNTIME and $NO_RUNTIME == true
