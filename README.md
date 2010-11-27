Runtime
=======
Runtime is a runtime library for Ruby (_oh, really?_).

It runs in the background and waits for your created events to be ready to emit at the current time, thus making your multithreaded applications a tad easier to maintain.

How does it work
================
When you include the Runtime gem, it immediately creates an instance of Runtime::Manager which then spawns a thread that starts a loop.
The loop then continues to check if one of your stored events are ready to pop.

You can force the Runtime library not to start by itself by setting `$NO_RUNTIME = true` before including the gem.
If you want to enable Runtime at a later point, just call `Runtime.enable`.

How can I schedule my events
============================
There's 2 methods that enables you to schedule your events to pop at a given time. They are called `at` and `_in` (`in` is a Ruby keyword, hence the _ prefix).

The `in` method takes 1+ arguments.
The first one is 'when' you want it to pop (can be a `Time` instance and a `Fixnum`), and the other ones are if you want to pass them to your block when it's emitted.

The `at` also takes 1+ arguments.
The first argument can be a String and a Time instance. A string example can be `"12:00 pm GMT+2"` and it will pop at 12:00 pm according to the GMT+2 timezone.

Extensions
==========
Runtime provides 4 method extensions to the Fixnum class. Those are

  * `seconds`
  * `minutes`
  * `hours`
  * `days

**Note:** all methods also has a singularis alias which points to their respective pluralus method (`second`, `minute` e.g.)

Examples
========
Raise an event that says "Hello world" in 5 minutes:

    _in 10.minutes do
      puts "Hello world"
    end

Or raise an event that says "Hello world" in one day:
  
    _in 1.day do
      puts "Hello world"
    end
