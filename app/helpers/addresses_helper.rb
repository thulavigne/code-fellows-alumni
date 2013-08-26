module AddressesHelper

  def states
    if @address.country.present? && @address.state.present?
      Country.search(@address.country).states.map{|s| [s.last["name"], s.first] }
    else
      Array.new
    end
  end

  def countries
    coll = Country.all
    country1 = Country.search('US')
    country2 = Country.search('CA')
    coll.insert(0, [country1.name, country1.alpha2])
    coll.insert(1, [country2.name, country2.alpha2])
  end

end
