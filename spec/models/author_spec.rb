RSpec.describe Author do
  subject(:author) { build(:author) }

  it { is_expected.to have_many(:books) }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
end