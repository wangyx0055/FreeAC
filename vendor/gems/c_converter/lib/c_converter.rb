require "rexml/document"
include REXML

module CConverter
  class Convert

    #returns the rate on currencies
    def self.Currency(date,fromC,toC)
      doc = Document.new File.new(Rails.root.join('db','eurofxref-hist-90d.xml'))
      root = doc.root

      if fromC == "EUR"
        fromValue = 1
      elsif
      fromValue = root.elements["Cube/Cube[@time='#{date}']/Cube[@currency='#{fromC}']"].attributes["rate"] #gets the rate for "FROM"
      end

      if toC == "EUR"
        toValue = 1
      elsif
        toValue = root.elements["Cube/Cube[@time='#{date}']/Cube[@currency='#{toC}']"].attributes["rate"] #gets the rate fot "TO"
      end


      rate = toValue.to_f/fromValue.to_f
      return rate
    end


    #returns the Dates from xml
    def self.D_Array()
      @dates = []
      doc = Document.new File.new(Rails.root.join('db','eurofxref-hist-90d.xml'))
      root = doc.root
      root.elements.each("Cube/Cube") { |element|  @dates.push(element.attributes["time"]) } #gets all the dates
      return @dates
    end


    #returns the currencies from xml (just tha names)
    def self.C_Array()
      @cc = ["EUR"]
      dates = []
      doc = Document.new File.new(Rails.root.join('db','eurofxref-hist-90d.xml'))
      root = doc.root
      root.elements.each("Cube/Cube") { |element|  dates.push(element.attributes["time"]) } #gets all the dates
      root.elements.each("Cube/Cube[@time='#{dates[0]}']/Cube") { |element|  @cc.push(element.attributes["currency"]) } #gets all the dates
      return @cc
    end

  end
end
