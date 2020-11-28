# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create account', type: :feature do
  describe 'create debit account', type: :feature do
    let(:user) { create(:user) }

    it 'creates debit account with valid parameters' do
      login_as(user, scope: :user)
      visit user_path(user)
      within('.debit') do
        click_link('Nueva cuenta de débito')
      end
      click_button 'commit'
      expect(page).to have_content 'Account was successfully created.'
    end
  end

  describe 'creates checking account', type: :feature do
    let(:user) { create(:user) }

    it 'creates checking account with valid parameters' do
      login_as(user, scope: :user)
      visit user_path(user)
      within('.checking') do
        click_link('Nueva cuenta corriente')
      end
      click_button 'commit'
      expect(page).to have_content 'Account was successfully created.'
    end
  end

  describe 'creates credit account', type: :feature do
    let(:user) { create(:user) }

    it 'creates credit account with valid parameters' do
      login_as(user, scope: :user)
      visit user_path(user)
      within('.credit') do
        click_link('Nueva cuenta de crédito')
      end
      click_button 'commit'
      expect(page).to have_content 'Account was successfully created.'
    end
  end
end
