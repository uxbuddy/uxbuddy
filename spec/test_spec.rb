describe Test do

  describe "Load data" do

    let!(:test) { Test.find(1) }

    it 'Test 3 should have 3 comments on question 1' do
      question_1 = test.questions[0]
      expect(question_1.comments(test.id).count).to eq(3)
    end

  end

end
