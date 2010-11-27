# encoding: utf-8

module Runtime
  class Event
    attr_accessor :time

    def initialize time, *args, &block
      @time, @args, @proc = time, args, block
    end

    def pull
      @proc.call *@args
    end
  end
end
