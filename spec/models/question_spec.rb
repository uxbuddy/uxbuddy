describe Question do

  let(:test) { Test.create(name: 'Giphy', test_url: "http://www.giphy.com", test_type_id: 1, slug: "giphy", question_ids: [1]) }

  describe "Load data" do

    it 'should load some data at the start' do
      expect(Question.count).to eq(8)
    end

  end

  describe "#comments" do

    before(:each) do
      Answer.create(format: "range", response: 5, question_id: 1, test_id: test.id, comment: "wow")
    end

    it 'should display all comments for particular question' do
      expect(test.questions[0].comments(Test.last.id)).to eq ["wow"]
    end

  end

end
