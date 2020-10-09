# frozen_string_literal: true

require 'csv'

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    # turn to an csv object then turn to an array of hashes
    @data = CSV.parse(tsv, { headers: true, col_sep: "\t" }).map(&:to_h)
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    header_str = @data.first.keys.join("\t")
    values = @data.map do |hash|
      hash.values.join("\t")
    end
    values_str = values.join("\n")
    header_str.concat("\n").concat(values_str).concat("\n")
  end
end

