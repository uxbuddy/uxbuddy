describe Question do

  describe "Load data" do

    it 'should load some data at the start' do
      expect(Question.count).to eq(8)
    end

  end

end
