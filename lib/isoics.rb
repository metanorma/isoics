require "isoics/version"
require "json"
require "isoics/ics"

module Isoics
  class << self
    # Fetch ICS data by code.
    # @param code [String]
    # @param fieldcode [String]
    # @param groupcode [String]
    # @param subgroupcode [String]
    # @return [Isoics::ICS]
    def fetch(code = nil, fieldcode: nil, groupcode: nil, subgroupcode: nil)
      unless code || fieldcode
        raise(ArgumentError,
              "wrong arguments (should be string or { fieldcode: [String] }")
      end

      if code
        fieldcode, groupcode, subgroupcode = code.split "."
      end

      ICS.new(fieldcode: fieldcode, groupcode: groupcode,
              subgroupcode: subgroupcode)
    end
  end
end
