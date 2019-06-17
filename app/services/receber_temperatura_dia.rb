class ReceberTemperaturaDia
    require 'net/http'
    require 'json'

    def buscar_dia(cidade)
        @cidade = cidade
        url = "http://api.openweathermap.org/data/2.5/forecast?q=#{@cidade},BR&APPID=fa4dcd2adf71cbf97685db86fc1b9d16&units=metric"
    
        retorno = JSON.parse(Net::HTTP.get(URI(url)))

        dados = []

        retorno["list"].each do |dia|
            dados << {hora: Time.at(dia["dt"]), 
            Clima:{Temperatura: dia["main"]["temp"],
            Descrição: dia["weather"][0]["description"],
            Pressao: dia["main"]["pressure"],
            Humidade: dia["main"]["humidity"], 
            Temperatura_Maxima: dia["main"]["temp_max"], 
            Temperatura_Minima: dia["main"]["temp_min"], 
            Velocidade_Vento: dia["wind"]["speed"]}} 

        end
        dados
    
        
    end

end






