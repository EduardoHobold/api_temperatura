class BuscaTemperaturaController < ApplicationController

    def buscar
        
        render json: ReceberTemperatura.new.buscar(temp_params[:cidade]), status: :ok 

    end

    def buscar_hora

        render json: ReceberTemperaturaHora.new.buscar_hora(temp_params[:cidade]), status: :ok 

    end

    def buscar_dia

        render json: ReceberTemperaturaDia.new.buscar_dia(temp_params[:cidade]), status: :ok 

    end
    
    private

    def temp_params
        params.permit(:cidade)
    end
end