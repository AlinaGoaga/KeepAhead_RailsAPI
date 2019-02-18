describe 'Venues API' do
  it 'sends a list of venues' do

    get 'http://localhost:3000/api/v1/venues'

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json['venues'].length).to eq(5)
  end

end