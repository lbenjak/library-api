RSpec.describe Book do
  subject(:book) { build(:book) }

  # binding.pry

  it { is_expected.to belong_to(:author) }
  it { is_expected.to have_many(:ratings) }
  it { is_expected.to have_many(:book_genres).dependent(:destroy) }
  it { is_expected.to have_many(:genres).through(:book_genres) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:number_of_copies) }
  it { is_expected.to validate_presence_of(:isbn) }
  it { is_expected.to validate_presence_of(:pages) }
  it { is_expected.to validate_presence_of(:published_at) }

  it { is_expected.to validate_numericality_of(:pages).only_integer }
  it { is_expected.to validate_numericality_of(:number_of_copies).only_integer }
  it { is_expected.to validate_uniqueness_of(:isbn).case_insensitive }
end