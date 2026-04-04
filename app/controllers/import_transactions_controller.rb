class ImportTransactionsController < ApplicationController
  def analyze
    file_name = params[:file].original_filename

    rows = Camt052ImportService.new(params[:file].read).call
    rows.each do |row|
      p row[:amount].to_s("F")
      p row[:balance_after_booking].to_s("F")
    end


    debugger
  end
end
