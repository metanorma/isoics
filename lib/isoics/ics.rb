module Isoics
  class Note
    # @return [String]
    attr_reader :text, :ics_code

    # @param note [Hash]
    def initialize(note)
      @text, @ics_code = note.values_at(:text, :"ics-code")
    end

    # Fetch referenced ICS.
    # @return [Isoics::ICS]
    def ics
      Isoics.fetch ics_code if ics_code
    end
  end

  class ICS
    # @return [String]
    attr_reader :code, :fieldcode, :groupcode, :subgroupcode, :description,
      :description_full

    # @return [Array<Isoics::Note>]
    attr_reader :notes

    # @param ics_data [Hash]
    def initialize(fieldcode:, groupcode: nil, subgroupcode: nil)
      file_name = "#{__dir__}/../../ics/#{fieldcode.to_s}"
      file_name << "_#{groupcode}" if groupcode
      file_name << "_#{subgroupcode}" if subgroupcode 
      file_name << ".json"
      ics_data = JSON.parse File.read(file_name), symbolize_names: true

      @code, @fieldcode, @groupcode, @subgroupcode, @description,
          @description_full = ics_data.values_at(
        :code, :fieldcode, :groupcode, :subgroupcode, :description, :descriptionFull
      )

      @notes = if ics_data[:notes]
        ics_data[:notes].map { |n| Note.new n }
      else
        []
      end
    end
  end
end