class ReceberTemperatura
    require 'net/http'
    require 'json'

    def buscar(cidade)
        @cidade = cidade
        url = "http://api.openweathermap.org/data/2.5/weather?q=#{@cidade},BR&APPID=cda9070aa94fc9443a4348e9c1122d07&units=metric"

        retorno = JSON.parse(Net::HTTP.get(URI(url)))

        retorno["main"]["temp"]

    
    end
end