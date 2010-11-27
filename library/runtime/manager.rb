# encoding: utf-8

Thread.abort_on_exception = true

module Runtime
  class Manager
    def initialize
      @pool   = Pool.new
      @thread = spawn_thread
    end

    def manage
      @pool.each_event_at current_time do |event|
        @pool.drop event
        event.pull
      end
    end

    def add_event event
      @pool.push event if event.time >= current_time
    end

  private
    
    def spawn_thread
      Thread.new do
        loop { manage; sleep 1 }
      end
    end

    def current_time; Time.now.to_i end
  end
end
