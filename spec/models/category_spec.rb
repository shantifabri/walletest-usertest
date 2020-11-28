# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'attributes' do
    subject { described_class.new(name: 'something') }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to allow_value('viajes').for(:name) }
    it { is_expected.not_to allow_value('').for(:name) }
  end

  describe 'columns' do
    subject(:category) { described_class.new }

    it do
      expect(category).to have_db_column(:name)
        .of_type(:string)
    end
  end
end
