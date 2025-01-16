class AddressesService
    def self.save(address)
      address.save
    end
  
    def self.update(address, address_params)
      address.update(address_params)
    end
  
    def self.destroy(address)
      address.destroy
    end
end
  