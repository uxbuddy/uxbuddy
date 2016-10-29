describe Answer do
  describe "Load data" do

    it 'should load some data at the start' do
      expect(Answer.count).to eq(27)
    end
  end

end
