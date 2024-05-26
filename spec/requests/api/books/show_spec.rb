describe 'Show a book' do
  let!(:book)  { create(:book, title: 'The Lord of the Rings', number_of_copies: 20) }

  it 'returns the right book' do
    get "/api/books/#{book.id}", headers: default_headers

    expect(response).to have_http_status(:ok)
    expect(response_attributes[:title]).to eq(book.title)
  end
end