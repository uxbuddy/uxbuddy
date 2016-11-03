describe Test do

  let!(:test1) { Test.create(name: 'test', test_url: "http://www.test.com", test_type_id: 1, slug: "test", question_ids: [1])}
  let!(:test2) { Test.create(name: 'answered', test_url: "http://www.test.com", test_type_id: 1, slug: "answered", question_ids: [1])}
  let!(:test3) { Test.create(name: 'unanswered', test_url: "http://www.test.com", test_type_id: 1, slug: "unanswered", question_ids: [1])}
  let!(:answer1) { double :answer, response: 4, test_id: test2.id }
  let!(:answer2) { double :answer, response: 2, test_id: test2.id }

  describe '#number_respondents' do

    it 'should return the number of people have answered Test 1 as 0' do
      expect(test1.number_respondents).to eq(0)
    end

  end

  describe '#average_score' do

    before(:each) do
      allow(test2).to receive(:answers).and_return([answer1, answer2])
    end

    it 'should return "awaiting responses" if no respondents' do
      expect(test1.average_score).to eq('Awaiting responses')
    end

    it 'should calculate the overall test average from all answers' do
      expect(test2.average_score).to eq(3)
    end
  end

  describe '#complete_respondents' do

    it 'should have a test' do

    end

  end
end
