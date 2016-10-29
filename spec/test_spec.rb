describe Test do

  describe "Load data" do

    let!(:test1) { Test.find(1) }
    let!(:test3) { Test.find(3) }

    it 'should have some associated questions' do
      expect(test1.questions.count).to eq(3)
      expect(test3.questions.count).to eq(3)
    end

    xit 'should have 15 answers' do #skipped as changes for every new test answering questions
      expect(test3.answers.count).to eq(16)
    end

    xit 'should have 5 answers to Question 3' do #skipped as changes for every new test answering questions
      answers_to_question_1 = test1.answers.where(question_id: 3)
      expect(answers_to_question_1.count).to eq(5)
    end

  end

end
