class DocumentosController < ApplicationController
  before_action :set_documento, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /documentos
  def index
    @documentos = Documento.all

    render json: @documentos
  end
  #consultacola <- envia a cola de procesamiento para envio posterior
  def consultacola
    xjson=  {correo: params[:correo]}
    xparametros= {nit: params[:nit], fecha_emision: params[:fecha_emision   ], valor_total:  params[:valor_total], correo: params[:correo], formato:params[:formato]}
    UserMailer.with(xparametros).welcome_email.deliver_later 
    render json: {mensaje: "Solicitud Enviada"}

  end
  
  def guardardoc

    valorxml = request.body.read
    doc = Nokogiri::XML(valorxml)
    resultados=doc.xpath("//dte:Emisor")
    xcorreo= resultados[0].attr('CorreoReceptor')
    xnit= resultados[0].attr('NITEmisor')
    resultados=doc.xpath("//dte:DatosGenerales")
    xfecha= resultados[0].attr('FechaHoraEmision')
    resultados=doc.xpath("//dte:Total")
    xtotal=resultados[0].content  #para el valor_total
    puts('-------------------------------------------------------------------------------------------')
    xjson=  {docxml: valorxml, nit:xnit, fecha_emision:xfecha, valor_total:xtotal, correo:xcorreo, email: xcorreo}
    puts('-------------------------------------------------------------------------------------------')
     @documento = Documento.new(xjson)

    if @documento.save
      render json: @documento, status: :created, location: @documento
    else
      render json: @documento.errors, status: :unprocessable_entity
    end

  end

  # GET /documentos/1
  def show
    #render json: @documento
    respond_to do |format|
        format.html
        format.csv { send_data @documento.to_csv, filename: "documento-#{Date.today}.csv" }
    end
  end

  def nuevodoc
    @documento = Documento.new(documento_params)
    puts('-----------------------------------------')
    puts(documento_params)
    puts('-----------------------------------------')
    if @documento.save
      render json: @documento, status: :created, location: @documento
    else
      render json: @documento.errors, status: :unprocessable_entity
    end
  end

  # POST /documentos
  def create
    @documento = Documento.new(documento_params)

    if @documento.save
      render json: @documento, status: :created, location: @documento
    else
      render json: @documento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /documentos/1
  def update
    if @documento.update(documento_params)
      render json: @documento
    else
      render json: @documento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /documentos/1
  def destroy
    @documento.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento
      @documento = Documento.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def documento_params
      params.require(:documento).permit(:docxml, :nit, :fecha_emision, :valor_total, :correo)
    end
   
end
