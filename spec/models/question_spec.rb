describe Question do

  let!(:test) { Test.create(name: 'test', test_url: "http://www.test.com", test_type_id: 1, slug: "test", question_ids: [1]) }
  let!(:test2) { Test.create(name: 'Giphy', test_url: "http://www.giphy.com", test_type_id: 1, slug: "giphy", question_ids: [1])}
  # let!(:question1) {test.questions[0]}
  # let!(:question2) {test2.questions[0]}
  # let!(:answers) {question1.answers.where(test_id: test.id)}
  # let!(:response1) {answers[0].response}
  # let!(:response2) {answers[1].response}
  # let!(:response3) {answers[2].response}
  # let!(:average) {(response1 + response2 + response3)/3.0}
  # let!(:comment1) {answers[0].comment}
  # let!(:comment2) {answers[1].comment}
  # let!(:comment3) {answers[2].comment}

  describe "Load data" do

    it 'should load some data at the start' do
      expect(Question.count).to eq(8)
    end

  end

  describe "Display comments" do

    before(:each) do

    end

    it 'should display all comments for particular question' do
      expect(question1.comments(test.id)).to eq [comment1, comment2, comment3]
    end

  end

end
