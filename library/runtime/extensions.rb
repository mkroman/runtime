# encoding: utf-8

class Fixnum
  def seconds; self end
  def minutes; seconds * 60 end
  def hours; minutes * 60 end
  def days; days * 24 end

  alias_method :second, :seconds
  alias_method :minute, :minutes
  alias_method :hour, :hours
  alias_method :day, :days
end
