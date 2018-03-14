require "isoics/version"
require "json"
require "isoics/ics"

module Isoics
  class << self
    # @param fieldcode [String]
    # @param groupcode [String]
    # @param subgroupcode [String]
    def fetch(fieldcode:, groupcode: nil, subgroupcode: nil)
      ICS.new fieldcode: fieldcode, groupcode: groupcode, subgroupcode: subgroupcode
    end
  end
end
