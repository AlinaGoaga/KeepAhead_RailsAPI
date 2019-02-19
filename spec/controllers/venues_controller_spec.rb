require 'rails_helper'

RSpec.describe VenuesController, type: :controller do

    describe '#venues' do 

      it 'should have an index page displaying add option' do 
        visit '/venues'
        expect(page).to have_content('add')
      end 
    end

end
