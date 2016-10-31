describe Question do

  let!(:test) { Test.find(1) }
  let!(:question1) {test.questions[0]}
  let!(:answers) {question1.answers.where(test_id: test.id)}
  let!(:response1) {answers[0].response}
  let!(:response2) {answers[1].response}
  let!(:response3) {answers[2].response}
  let!(:average) {(response1 + response2 + response3)/3.0}
  let!(:comment1) {answers[0].comment}
  let!(:comment2) {answers[1].comment}
  let!(:comment3) {answers[2].comment}

  describe "Load data" do

    it 'should load some data at the start' do
      expect(Question.count).to eq(8)
    end

    xit 'should calculate the average of the responses' do # skipped as changes when you add more tests for answers
      expect(question1.ave_response(test.id).round(1)).to eq(average.round(1))
    end

    it 'should display all comments for particular question' do
      expect(question1.comments(test.id)).to eq [comment1, comment2, comment3]
    end

  end

end
