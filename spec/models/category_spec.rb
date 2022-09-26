require 'rails_helper'

RSpec.describe Category, type: :model do
  
  subject { Category.new(name: 'Test Category', code: 'CAT1') }
  
  before { subject.save }
  
  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  
  describe 'name validation' do

    context 'when name is not unique' do
      before { described_class.create!(name: 'Test Category', code: 'CAT1') }
      it {expect(subject).to be_invalid}
    end
    
    context 'when name is  unique' do
      before { described_class.create!(name: 'Test Category1', code: 'CAT11') }
      it {expect(subject).to be_valid}
    end
    
    context 'when name is in downcase' do
      let(:category1) { described_class.create!(name: 'test1', code: 'testcode1') }
      it 'should change the name to upcase' do
        expect(category1.name).to eq('TEST1')
        expect(category1.code).to eq('testcode1')
      end
    end
    
    context 'when name is in upcase' do
      let(:category1) { described_class.create!(name: 'TEST', code: 'testcode') }
      it 'should not change the name to downcase' do 
        expect(category1.name).to_not eq('test')
      end
      
      it 'should not change the code to upcase' do 
        expect(category1.code).to_not eq('TESTCODE')
      end
    end
    
  end
  
end
