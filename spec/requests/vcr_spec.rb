RSpec.describe 'VCR', :vcr do
  it 'manages Net::HTTP requests' do
    response = Net::HTTP.get_response(URI('https://github.com/vcr'))
    expect(response.body).to include('VCR')
  end
end
