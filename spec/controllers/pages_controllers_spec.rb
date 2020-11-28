# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #home' do
    before { get :home }

    it { is_expected.to respond_with(200) }
    it { is_expected.to render_template('home') }
  end
end
