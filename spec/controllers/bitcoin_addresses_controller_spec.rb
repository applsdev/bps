require 'spec_helper'

describe BitcoinAddressesController do
  let(:bitcoin_address) { BitcoinAddress.make }

  describe '#show' do
    it do
      get :show, id: bitcoin_address.id, format: :json

      data = JSON.parse(response.body)
      %w{address public_key description}.each do |field|
        data[field].to_s.should == bitcoin_address.send(field).to_s
      end
      
      %w{private_key}.each do |field|
        data[field].should be_nil
      end
    end
  end

end
