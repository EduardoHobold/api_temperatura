class ReceberTemperaturaPredict
    require 'net/http'
    require 'json'

    def buscar_predict(cidade)
        @cidade = cidade
        url = "http://api.openweathermap.org/data/2.5/forecast?q=#{@cidade},BR&APPID=fa4dcd2adf71cbf97685db86fc1b9d16&units=metric"
    
        retorno = JSON.parse(Net::HTTP.get(URI(url)))

        dados = []

        retorno["list"].each do |hora|
            dados << {hora: Time.at(hora["dt"]), 
            clima:{Temperatura: hora["main"]["temp"],
            Presso: hora["main"]["pressure"],
            Humidade: hora["main"]["humidity"], 
            Temperatura_Maxima: hora["main"]["temp_max"], 
            Temperatura_Minima: hora["main"]["temp_min"], 
            Velocidade_Vento: hora["wind"]["speed"],
            Alvorada: Time.at(retorno["sys"]["sunrise"]), 
            Crepusculo: Time.at(retorno["sys"]["sunset"])}} 
        end
        dados
    
        
    end

end






