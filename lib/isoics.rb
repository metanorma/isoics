require "isoics/version"
require "json"
require "isoics/ics"

module Isoics
  class << self
    # @param fieldcode [String]
    # @param groupcode [String]
    # @param subgroupcode [String]
    def fetch(fieldcode:, groupcode: nil, subgroupcode: nil)
      file_name = "ics/#{fieldcode.to_s}"
      file_name << "_#{groupcode}" if groupcode
      file_name << "_#{subgroupcode}" if subgroupcode 
      file_name << ".json"
      ics_data = JSON.parse File.read(file_name), symbolize_names: true
      ICS.new ics_data
    end
  end
end
