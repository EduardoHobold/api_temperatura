class ReceberTemperaturaPredict
    require 'net/http'
    require 'json'

    def buscar_predict(cidade)
        @cidade = cidade
        url = "http://api.openweathermap.org/data/2.5/forecast?q=#{@cidade},BR&APPID=fa4dcd2adf71cbf97685db86fc1b9d16&units=metric"
    
        retorno = JSON.parse(Net::HTTP.get(URI(url)))
    
    end

end






