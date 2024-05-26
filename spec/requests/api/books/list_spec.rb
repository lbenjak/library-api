describe 'List all books' do
  let(:ibmazuranic) { create(:author, first_name: 'Ivana', last_name: 'Brlic Mazuranic') }
  let(:fairytale) { create(:genre, name: 'Fairytale') }
  let!(:regoc) { create(:book, title: 'Regoc', author: ibmazuranic,
                                genre_ids: fairytale.id, isbn: '978-3-16-148413-0') }

  let(:triller) { create(:genre, name: 'Triller') }
  let!(:sumastriborova) { create(:book, title: 'Suma striborova', isbn: '978-3-16-148410-0',
                                        author: ibmazuranic, genre_ids: triller.id) }

  let!(:ratings1) { create(:rating, book: regoc) }
  let!(:ratings2) { create(:rating, book: sumastriborova) }

  it 'returns a list of books with their authors, genres and ratings' do
    get '/api/books', headers: default_headers

    expect(response).to have_http_status(:ok)
    expect(Book.count).to eq(2)
  end
end