# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CheckingAccount, type: :model do
  describe 'attributes' do
    it { is_expected.to validate_inclusion_of(:currency).in_array(%w[USD CLP]) }

    it { is_expected.to belong_to(:user) }
  end

  describe 'columns' do
    subject(:checking_account) { described_class.new }

    it do
      expect(checking_account).to have_db_column(:currency)
        .of_type(:string)
    end

    it do
      expect(checking_account).to have_db_column(:liquid_balance)
        .of_type(:integer)
    end

    it do
      expect(checking_account).to have_db_column(:illiquid_balance)
        .of_type(:integer)
    end

    it { is_expected.to have_db_column(:user_id) }
  end
end
