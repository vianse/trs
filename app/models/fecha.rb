class Fecha < ActiveRecord::Base
#Sirve para la importacion de fechas
 require 'csv'
######

## scope ##
scope :MesActual ,-> (asignacion, id_consultor) {where("mes = ? and año = ?", asignacion, id_consultor )}
########### 

  def self.import(file)
    CSV.foreach(file.path, "r:ISO-8859-1" ) do |row|
      
      @fecha = row[0]
      @mes = row[1]
      @dia = row[2]
      @diaL = row[3]
      @mesl = row[4]
      @ano = row[5]
      
      Fecha.create!(:fecha => @fecha,:mes => @mes, :dia => @dia, :diaL => @diaL, :mesl => @mesl,:año => @ano)

    end # end CSV.foreach
  end # end sel
  
end
