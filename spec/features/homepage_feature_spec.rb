require 'rails_helper'

feature 'homepage' do
  xscenario 'am I working?' do
    visit '/'
    expect(page.status_code).to equal(200)
  end
end
