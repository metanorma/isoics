module Isoics
  class Note
    # @return [String]
    attr_reader :text, :ics_code

    # @param note [Hash]
    def initialize(note)
      @text, @ics_code = note.values_at(:text, :"ics-code")
    end
  end

  class ICS
    # @return [String]
    attr_reader :code, :fieldcode, :groupcode, :subgroupcode, :description,
      :description_full

    # @return [Array<Isoics::Note>]
    attr_reader :notes

    # @param ics_data [Hash]
    def initialize(ics_data)
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