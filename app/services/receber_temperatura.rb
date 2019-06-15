class ReceberTemperatura
    require 'net/http'
    require 'json'

    def buscar(cidade)
        @cidade = cidade
        url = "http://api.openweathermap.org/data/2.5/weather?q=#{@cidade},BR&APPID=fa4dcd2adf71cbf97685db86fc1b9d16&units=metric"

        retorno = JSON.parse(Net::HTTP.get(URI(url)))

        temp = {"Temperatura": retorno["main"]["temp"],
             "Pressão": retorno["main"]["pressure"],
             "Humidade": retorno["main"]["humidity"], 
             "Temperatura_Maxima": retorno["main"]["temp_max"], 
             "Temperatura_Minima": retorno["main"]["temp_min"], 
             "Velocidade_Vento": retorno["wind"]["speed"], 
             "Alvorada": Time.at(retorno["sys"]["sunrise"]), 
             "Crepusculo": Time.at(retorno["sys"]["sunset"])}

    end
end