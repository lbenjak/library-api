describe 'Delete a book' do
  let(:author) { create(:author) }
  let(:genre) { create(:genre) }
  let(:book) { create(:book, genre_ids: genre.id, author: author) }

  context 'when book exists' do
    it 'deletes a book' do
      delete "/api/books/#{book.id}", headers: default_headers

      expect(response).to have_http_status(:no_content)
      expect(Book.find_by(id: book.id)).to be_nil
    end
  end

  context 'when book does not exist' do
    it 'returns error details' do
      delete "/api/books/0", headers: default_headers

      expect(response).to have_http_status(:not_found)
    end
  end
end