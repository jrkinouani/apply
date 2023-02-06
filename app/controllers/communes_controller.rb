require "csv"
class CommunesController < ApplicationController
	before_action :check_format, only:[:index]

	def check_format
		http_accept = request.headers["HTTP_ACCEPT"]
		if http_accept != "application/json" && http_accept != "text/csv"
			render json: { }, status: 406
		end
	end

	def index
		commune_by_code = Commune.to_hash
		file_data = CSV.generate(headers: true, :col_sep => ";") do |csv|
			csv << ["code_insee", "name"]
			commune_by_code.each do |code_insee,name|
				csv << [code_insee, name]
			end
		end

		respond_to do |format|
			format.csv {send_data file_data, filename:"export_communes.csv"}
			format.json {commune_by_code}
		end

	end

	def show
		commune = Commune.find_by(code_insee: params[:id])
		if commune.nil?
			head 404
		else
			render json: commune,status: 200
		end
	end

	def create
		head :forbidden
	end

	def update
		commune = Commune.find_by(code_insee: params[:id])
		if commune.nil?
			head 404
		elsif params[:commune].nil?
			head 400
		else
			commune.update(commune_params)
			head 204
		end
	end

	private

	def commune_params
		params.require(:commune).permit(:name)
	end

end
