class LineItemDatesController < ApplicationController
  before_action :set_quote

  def new
    @line_item_date = @quote.line_item_dates.build
  end

  def create
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)
    if @line_item_date.save
      respond_to do |format|
        format.html { redirect_to quote_path(@quote), notice: 'Date was successfully created.' }
        # format.turbo_stream do
        #   flash.now[:notice] = {
        #     title: 'Success',
        #     message: 'Line Item Date was successfully created.'
        #   }
        # end
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end
end
