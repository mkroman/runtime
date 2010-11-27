# encoding: utf-8

module Runtime
  class Pool
    def initialize
      @events = []
    end

    def each_event_at time
      @events.select { |event| event.time == time }.each { |event| yield event }
    end

    def push event; @events << event end
    def drop event; @events.delete event end
  end
end
