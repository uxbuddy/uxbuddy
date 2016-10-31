describe TestType do

  describe "Load data" do

    let(:product_type) { TestType.find(1) }

    it 'should load some data at the start' do
      expect(TestType.count).to eq(7)
    end

    it 'should have 8 associated questions' do
      expect(product_type.questions.count).to eq(9)
    end

  end

end
