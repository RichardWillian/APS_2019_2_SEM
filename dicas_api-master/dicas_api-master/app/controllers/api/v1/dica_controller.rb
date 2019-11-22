module Api
  module V1
    class DicaController < ApiController

      def dicas
        dicas = {
          1 => "Economizar água é algo essencial!",
          2 => "Evite o desperdício de papel e contribua para a redução do corte de árvores e do lançamento dos gases que formam o efeito estufa. Use o outro lado dos papéis como rascunho",
          3 => "Utilize a água somente o necessário. Só 2,5% da água do Planeta Terra é doce e destes, somente 0,01% é utilizável pelo homem. Portanto, nunca lave uma calçada utilizando uma mangueira. Use um balde",
          4 => "Deixe o carro na garagem e utilize o transporte coletivo e a bicicleta, quando possível. Dê preferência a combustíveis como o álcool e o biodiesel. Faça revisões periódicas no seu veículo para reduzir as emissões de poluentes",
          5 => "Ajude a recuperar o verde de sua cidade. Plante árvores no seu quintal, na sua propriedade rural e até mesmo em áreas públicas",
          6 => "Evite o desperdício de água. Feche sempre a torneira quando não estiver em uso. Em áreas sujeitas a secas prolongadas, armazene água. E arrume as torneiras que estão pingando. Uma torneira pingando desperdiça mais de 40 litros de água por dia",
          7 => "Economize energia. Troque lâmpadas incandescentes por fluorescentes, apague luzes desnecessárias, desligue aparelhos domésticos quando não estiverem em uso e compre eletrodomésticos classificados como nível A em eficiência energética",
          8 => "Não compre mais que o necessário, pois certamente vai virar lixo dentro da sua casa, ocupando espaço, muitas vezes, por anos a fio e sem utilidade, portanto, se tem excessos, faça trocas ou doações",
          9 => "Desligue o computador. Muita gente tem o péssimo hábito de deixar o computador ligado ininterruptamente, às vezes fazendo downloads, às vezes por pura comodidade.",
          10 => "Use sacolas de pano em vez das de plástico. Sacolas de plástico – quando jogadas nas vias públicas – entopem os esgotos e provocam enchentes.",
        }
   
        unless params[:idMensagem].to_i.blank?
          id = params[:idMensagem].to_i
          dica = dicas[params[:idMensagem].to_i]
          if dica.blank?
            id = rand(1..10)
            dica = dicas[id]
          end
        else
          id = rand(1..10)
          dica = dicas[id]
        end

        respond_to do |format|
          format.json {render json: {id: id.to_i, dica: dica.to_s }}
        end
      end

    end

    private

      def dicas_params
        params.require(:dicas).permit(:ordem)
      end
  end
end
