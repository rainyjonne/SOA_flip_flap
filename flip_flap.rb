# frozen_string_literal: true

require_relative 'tsv_buddy'
require_relative 'yaml_buddy'

# Converts tabular data between storage formats
class FlipFlap
  # Do NOT create an initialize method
  include TsvBuddy
  include YamlBuddy

  attr_reader :data

  # this class can only have one input_formats, so use self
  def self.input_formats
    # the methods that FlipFlap class has
    method_names = instance_methods.map(&:to_s)
    # select the method which name includes the string "take"
    outputs = method_names.select { |method| method.match(/^take_/) }
    # if outputs are null return empty array,
    # otherwise return the method name without "take_",
    # from the 5th char of string to the end
    outputs ? outputs.map { |method| method[5..-1] } : []
  end
end
