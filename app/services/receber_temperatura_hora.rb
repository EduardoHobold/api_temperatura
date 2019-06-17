class ReceberTemperaturaHora
    require 'net/http'
    require 'json'

    def buscar_hora(cidade)
        @cidade = cidade
        url = "http://api.openweathermap.org/data/2.5/forecast?q=#{@cidade},BR&APPID=fa4dcd2adf71cbf97685db86fc1b9d16&units=metric"
    
        retorno = JSON.parse(Net::HTTP.get(URI(url)))

        dados = []

        retorno["list"].each do |hora|
            dados << {hora: Time.at(hora["dt"]), 
            Clima:{Temperatura: hora["main"]["temp"],
            Descrição: hora["weather"][0]["description"],
            Pressao: hora["main"]["pressure"],
            Humidade: hora["main"]["humidity"], 
            Temperatura_Maxima: hora["main"]["temp_max"], 
            Temperatura_Minima: hora["main"]["temp_min"], 
            Velocidade_Vento: hora["wind"]["speed"]}} 

        end
        dados
    
        
    end

end






