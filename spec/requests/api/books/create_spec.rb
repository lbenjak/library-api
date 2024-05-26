describe 'Create book' do
  let(:author) { create(:author) }
  let(:genre) { create(:genre) }

  context 'with valid attributes' do
    let(:book_attributes) do
      {
        title: 'The Lord of the Rings',
        isbn: '978-3-16-148410-0',
        number_of_copies: 10,
        pages: 1000,
        published_at: '1954-07-29'
      }
    end
    let(:relationships) do
      {
        author: {
          data: {
            type: 'authors',
            id: author.id.to_s
          }
        },
        genres: {
          data: [{
            type: 'genres',
            id: genre.id.to_s
          }]
        }
      }
    end
    let(:valid_params) { json_api_request_body('books', book_attributes, relationships) }

    it 'creates a new book' do
      post '/api/books', params: valid_params, headers: default_headers

      expect(response).to have_http_status(:created)
      expect(response_attributes[:title]).to eq(book_attributes[:title])
      expect(response_attributes[:author][:id]).to eq(author.id)
      expect(response_attributes[:genres].count).to eq(1)
      expect(response_attributes[:genres].first[:id]).to eq(genre.id)
    end
  end

  context 'with invalid attributes' do
    let(:invalid_book_attributes) do
      {
        title: '',
        isbn: 'abc123',
        number_of_copies: 0,
        pages: 'thousand'
      }
    end
    let(:invalid_params) { json_api_request_body('books', invalid_book_attributes) }

    it 'does not create a new book' do
      post '/api/books', params: invalid_params, headers: default_headers

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'with invalid request body' do
    it 'does not create a new book' do
      post '/api/books', params: { invalid: 'invalid' }, headers: default_headers

      expect(response).to have_http_status(:bad_request)
    end
  end
end