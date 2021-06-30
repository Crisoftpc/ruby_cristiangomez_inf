class ApplicationMailer < ActionMailer::Base
 
end





    #@documento = params[:documento]
    #@url  = 'http://example.com/login'
    #puts('---------------------------------------------------------------------------------------------------------')
    # @documento = Documento.find_by_sql(
    #{}"select * 
    # FROM documentos 
    # WHERE correo = '#{@user.correo}'
    
    # ORDER BY id asc limit 1")
    # puts('---------------------------------------------------------------------------------------------------------')
    # if @documento 
    # 	puts('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    # 	mail(to: @documento.correo, subject: 'Welcome to My Awesome Site')
    # else
    # 	puts('//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////')
    # 	mail(to: @user.correo, subject: 'El documento enviado es incorrecto')
    # 	puts("Documento incorrecto- sin correo")
    # end 