describe Test do

  describe "Load data" do

    let!(:test1) { Test.find(1) }
    let!(:test3) { Test.find(3) }

    it 'should have some associated questions' do
      expect(test1.questions.count).to eq(3)
      expect(test3.questions.count).to eq(3)
    end

    xit 'Test 1 should have 9 answers' do # skipped as changes when you add more tests for answers
      expect(test1.answers.where(test_id: test1.id).count).to eq(9)
    end

    xit 'Test 1 should have 3 answers to Question 1' do # skipped as changes when you add more tests for answers
      question_1 = test1.questions[0]
      answers_to_question_1 = question_1.answers.where(test_id: test1.id)
      expect(answers_to_question_1.count).to eq(3)

    end

  end

end
