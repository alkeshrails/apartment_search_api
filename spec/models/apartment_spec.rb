require 'rails_helper'

RSpec.describe Apartment, type: :model do
  subject { create(:apartment) }
  it { expect(subject).to be_valid }
end
