describe TestType do

  describe "Load data" do

    it 'should load some data at the start' do
      expect(TestType.count).to eq(1)
    end

  end

end
