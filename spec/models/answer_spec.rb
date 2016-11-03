describe Answer do

 let!(:test) { Test.create(name: 'test', test_url: "http://www.test.com", test_type_id: 1, slug: "test", questions: [question]) }
 let!(:question) { Question.first }

 before do
   described_class.build_answer({response: 3}, test, 0)
 end

 describe "#build_answer" do

   let(:answer) { Answer.last }

   it 'saves a test id to the answer' do
     expect(answer.test_id).to eq test.id
   end

   it 'saves a question id to the answer' do
     expect(answer.question_id).to eq question.id
   end

   it 'saves a format to the answer' do
     expect(answer.format).to eq question.format
   end

 end

end
