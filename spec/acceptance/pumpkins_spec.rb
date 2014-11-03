
require "rails_helper"
require "rspec_api_documentation/dsl"

resource 'Pumpkins' do
  header 'Host', 'api.example.com'
  header "Content-Type", "application/json"

  let!(:pumpkins) {  create_list(:pumpkin, 2) }
  response_field :id, "Pumpkin ID", 'Type' => 'Integer'
  response_field :name, "Name of pumpkin", 'Type' => 'String'
  response_field :weight, "Weight in kilograms", 'Type' => 'Float'
  response_field :softness, "How much soft it is", 'Type' => 'String', 'Values' => 'hard, middle, soft'
  response_field :name, "Name of the farm where the pumpkin was grown", 'Type' => 'String', scope: :farm
  response_field :city, "Where is the farm located", 'Type' => 'String', scope: :farm

  get '/v1/pumpkins' do
    example_request 'List pumpkins' do
      explanation 'List all available pumpkins'

      expect(status).to eq 200
      expect(JSON.parse(response_body).size).to eq 2
    end
  end

  get '/v1/pumpkins/:id' do
    let(:pumpkin) { pumpkins.first }
    let(:id) { pumpkin.id }

    example_request 'Get specific pumpkin' do
      explanation 'Get a pumpkin by id'

      expect(status).to eq 200
      expect(JSON.parse(response_body)['name']).to eq pumpkin.name
    end
  end

  post '/v1/pumpkins' do
    parameter :name, "Name of pumpkin", required: true, scope: :pumpkin
    parameter :weight, "Weight in kilograms", required: false, scope: :pumpkin
    parameter :softness, "How much soft it is", required: false, scope: :pumpkin
    parameter :farm_attributes, "Parameters of the pumpkin's farm", required: false, scope: :pumpkin, 'Sub-fields' => 'name, city'

    let(:name) { 'Jack' }
    let(:weight) { 2500 }
    let(:softness) { 'hard' }
    let(:farm_attributes) { { name: 'Roga i Kopyta LLC', city: 'Kiev' } }

    example_request 'Create pumpkin' do
      explanation 'Create the new fresh juicy pumpkin'

      expect(status).to eq 201
      expect(JSON.parse(response_body)['name']).to eq name
    end
  end

end