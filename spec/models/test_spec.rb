describe Test do

  describe "Load data" do
    let!(:test1) { Test.find(1) }
    let!(:test3) { Test.find(3) }

    it 'should have some associated questions' do
      expect(test1.questions.count).to eq(3)
      expect(test3.questions.count).to eq(3)
    end

    it 'Test 1 should have 9 answers' do # skipped as changes when you add more tests for answers
      expect(test1.answers.where(test_id: test1.id).count).to eq(13)
    end

    it 'Test 1 should have 3 answers to Question 1' do # skipped as changes when you add more tests for answers
      question_1 = test1.questions[0]
      answers_to_question_1 = question_1.answers.where(test_id: test1.id)
      expect(answers_to_question_1.count).to eq(3)
    end

    it 'Test 3 should have 3 comments on question 1' do
      question_1 = test3.questions[0]
      expect(question_1.comments(test3.id).count).to eq(3)
    end
  end

  describe '#number_respondents' do
    let!(:test1) { Test.create(name: 'test', test_url: "http://www.test.com",
                               test_type_id: 1, slug: "test", question_ids: [1])}
    it 'should return the number of people have answered at least one question' do
      expect(test1.number_respondents).to eq(0)
    end
  end

  xdescribe '#average_score' do
    let!(:test1) { Test.create(name: 'unanswered', test_url: "http://www.test.com",
                               test_type_id: 1, slug: "unanswered", question_ids: [1])}

    let!(:test2) { Test.create(name: 'answered', test_url: "http://www.test.com",
                               test_type_id: 1, slug: "answered", question_ids: [1])}

    let!(:answer1) { double :answer, response: 4, test_id: test2.id }
    let!(:answer2) { double :answer, response: 2, test_id: test2.id }

    before(:each) do
      allow(test2).to receive(:answers).and_return([answer1, answer2])
    end

    it 'should return awaiting responses if no respondents' do
      expect(test1.average_score).to eq('awaiting responses')
    end

    it 'should calculate the overall test average from all answers' do
      expect(test2.average_score).to eq(3)
    end
  end
end
