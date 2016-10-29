describe Question do

  # let!(:question) {Question.create(id: 9, format: "Range", text: "Dummy question")}
  # let!(:test) {Test.create(name: 'Youtube', test_url: "https://www.youtube.com/embed/XGSy3_Czz8k", test_type_id: 1, slug: "youtube", question_ids: 9)}

  describe "Load data" do

    it 'should load some data at the start' do
      expect(Question.count).to eq(8)
    end

    # it "ave_response returns 3.5" do
    #   puts question.inspect
    #   Answer.create(format: "Range", response: 2, question_id: question.id)
    #   puts question.inspect
    #   Answer.create(format: "Range", response: 2, question_id: question.id)
    #   expect(question.ave_response).to eq(2)
    # end

  end

end
