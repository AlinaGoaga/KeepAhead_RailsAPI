require 'rails_helper'

RSpec.describe VenuesController, type: :controller do

    describe '#venues' do 

      it 'should have an index page displaying add option' do 
        get :index
        expect(page).to have_content('add')
      end 
    end

end
