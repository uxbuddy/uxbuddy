describe Test do

  let!(:test) { Test.create(name: 'unanswered', test_url: "http://www.test.com", test_type_id: 1, slug: "unanswered", question_ids: [1])}
  let!(:test2) { Test.create(name: 'answered', test_url: "http://www.test.com", test_type_id: 1, slug: "answered", question_ids: [1,2])}
  let!(:answer1) {Answer.create(format: "range", response: 5, question_id: 1, test_id: Test.last.id, comment: "wow") }
  let!(:answer2) {Answer.create(format: "range", response: 1, question_id: 1, test_id: Test.last.id, comment: "wow") }


  describe '#number_respondents' do

    it 'should return the number of people have answered Test as 0' do
      expect(test.number_respondents).to eq(0)
    end

  end

  describe '#average_score' do

    it 'should return "awaiting responses" if no respondents' do
      expect(test.average_score).to eq('Awaiting responses')
    end

    it 'should calculate the overall test average from all answers' do
      expect(Test.last.average_score).to eq(3)
    end
  end

  describe '#complete_respondents' do

    it 'should have a test' do
      expect(Test.last.complete_respondents).to eq("0%")
    end

  end
end
