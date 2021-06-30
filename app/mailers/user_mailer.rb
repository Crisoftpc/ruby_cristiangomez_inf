class UserMailer < ApplicationMailer
  default from: 'crisoftpc1@gmail.com.com'
  layout 'mailer'
  def welcome_email
    #@documento = params[:user]
    xcorreo=params[:correo]
    xnit=params[:nit]
    xfecha_emision= params[:fecha_emision]
    xvalor_total=params[:valor_total]
    @xformato= params[:formato]
    #Nit
	#Fecha de emisión
	#Valor Total de la factura
	#Formato de salida: CSV o PDF o Texto
	#Correo
	@nombre_archivo = SecureRandom.hex
    @htmlformato = true 
    @documento = Documento.find_by_sql("select * FROM documentos  WHERE nit ='#{xnit}' and fecha_emision= '#{xfecha_emision}' and valor_total= #{xvalor_total} ORDER BY id asc limit 1")
    @total = @documento.size()
    if (@total>=1)
        @htmlformato = true 
    else
        @htmlformato = false    
    end
    	puts('-------------------------------------------------------------------------------------------------------------------------------------')
    	puts(@documento)
    	puts('-------------------------------------------------------------------------------------------------------------------------------------')
        @correox= xcorreo
        @url  = 'http://localhot:3000.com/factura'
        mail(to: xcorreo, subject: 'Su documento')
    
 
  end
end
