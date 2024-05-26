describe 'Update a book' do
  let!(:book)  { create(:book, title: 'The Lord of the Rings', number_of_copies: 20) }

  let(:book_attributes) do
    {
      number_of_copies: 25
    }
  end

  let(:valid_params) { json_api_request_body('books', book_attributes) }

  it 'updates copies of a certain book' do
    patch "/api/books/#{book.id}", headers: default_headers, params: valid_params

    expect(response).to have_http_status(:ok)
    expect(response_attributes[:number_of_copies]).to eq(25)
  end
end