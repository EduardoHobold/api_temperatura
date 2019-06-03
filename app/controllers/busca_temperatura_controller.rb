class BuscaTemperaturaController < ApplicationController

    def buscar
        
        render json: ReceberTemperatura.new.buscar(temp_params[:cidade]), status: :ok 

    end

    def buscar_predict

        render json: ReceberTemperaturaPredict.new.buscar_predict(temp_params[:cidade]), status: :ok 

    end
    
    private

    def temp_params
        params.permit(:cidade)
    end
end