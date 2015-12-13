require 'spec_helper'

RSpec.describe LondonTransport::Line do
  describe '#names' do
    context 'API returns an empty array' do
      subject { LondonTransport::Line.new([]) }

      it { expect(subject.names).to eq([]) }
    end

    context 'API returns an line data' do
      let(:api_resonse) {
        [
          {
            "$type" => "Tfl.Api.Presentation.Entities.LineModeGroup, Tfl.Api.Presentation.Entities",
            "modeName" => "tube",
            "lineIdentifier" => ["bakerloo","central","victoria"]
          }
        ]
      }
      subject { LondonTransport::Line.new(api_resonse) }

      it { expect(subject.names).to eq(["bakerloo","central","victoria"]) }
    end
  end
end
