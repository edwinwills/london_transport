require 'spec_helper'

RSpec.describe LondonTransport::Base do
  subject { LondonTransport::Base.new(longitude: -0.1440493, latitude: 51.5152117) }

  describe '#stations' do
    context 'no nearest stop points' do
      before do
        allow(subject).to receive(:nearest) { nil }
      end

      it { expect(subject.stations).to eq([]) }
    end
  end
end
