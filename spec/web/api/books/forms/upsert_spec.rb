describe Api::Books::Form::Upsert do
  subject { described_class.new }

  describe 'isbn_format' do
    it 'is invalid if ISBN length is not 10 or 13' do
      subject.isbn = '123456789'
      subject.validate
      expect(subject.errors[:isbn]).to include('length must be either 10 or 13 digits')

      subject.isbn = '123456789012'
      subject.validate
      expect(subject.errors[:isbn]).to include('length must be either 10 or 13 digits')
    end

    it 'is invalid if ISBN contains non-digit characters (except "X" as the last character for 10-digit ISBN)' do
      subject.isbn = '123456789A'
      subject.validate
      expect(subject.errors[:isbn]).to include('must contain only digits or "X" for the last character of a 10-digit ISBN')

      subject.isbn = '97845678901E2'
      subject.validate
      expect(subject.errors[:isbn]).to include('must contain only digits or "X" for the last character of a 10-digit ISBN')
    end

    it 'is invalid if 13-digit ISBN does not start with "978" or "979"' do
      subject.isbn = '1234567890123'
      subject.validate
      expect(subject.errors[:isbn]).to include('13-digit ISBN must start with "978" or "979"')
    end

    it 'is valid with a correct 10-digit ISBN' do
      subject.isbn = '123456789X'
      subject.validate
      expect(subject.errors[:isbn]).to be_empty
    end

    it 'is valid with a correct 13-digit ISBN starting with "978"' do
      subject.isbn = '9781234567890'
      subject.validate
      expect(subject.errors[:isbn]).to be_empty
    end

    it 'is valid with a correct 13-digit ISBN starting with "979"' do
      subject.isbn = '9791234567890'
      subject.validate
      expect(subject.errors[:isbn]).to be_empty
    end

  end
end