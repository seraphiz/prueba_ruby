def read_alum(file_name)
file = File.open(file_name, 'r')
alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
file.close
alum
end

def aprobados(parametro, nota_aprobacion = 5.0)
  parametro.each do |alumno_promedio|
    alumno = alumno_promedio[0]
    promedio = alumno_promedio[1..-1].map { |num| num.to_i }
    notas = promedio.sum / promedio.count.to_f
   if notas >= nota_aprobacion
      puts "El/La alumnx #{alumno} esta aprobadx con un promedio #{notas}!"
      puts ''
    end
  end
end

listado_de_alumnos = read_alum('alumnos.csv')

#[["David", "9", "2", "5", "1", "1"],
#["Macarena", "10", "2", "A", "8", "1"],
#["Ignacio", "10", "10", "9", "9", "A"],
#["Rocio", "10", "10", "10", "10", "10"]]

def menu
  puts 'Opción 1) Nombre y Promedios por alumnos'
  puts 'Opción 2) Nombres y cantidad de inasistencias'
  puts 'Opción 3) Nombre alumnos aprobados'
  puts 'Opcion 4) Salir'
end

menu
puts 'Ingrese una de las 4 opciones:'
opcion = gets.chomp.to_i

while opcion !=4
  if opcion == 1
    listado_de_alumnos.each do |alumno_promedio|
      alumno = alumno_promedio[0]
      promedio = alumno_promedio[1..-1].map { |num| num.to_i }
      notas = promedio.sum / promedio.count.to_f
      puts "El/La alumnx #{alumno} tiene promedio #{notas}"
      puts ''
    end

    #[["David", "9", "2", "5", "1", "1"],
    #["Macarena", "10", "2", "A", "8", "1"],
    #["Ignacio", "10", "10", "9", "9", "A"],
    #["Rocio", "10", "10", "10", "10", "10"]]

  elsif opcion == 2
    listado_de_alumnos.each do |alumnos|
      nombre = alumnos[0]
      asistencia = alumnos[1..-1].include? "A"
      variable = 0
      if asistencia == true
      variable += 1
      puts "#{nombre}:#{variable} inasistencias"
    else
      puts "#{nombre}:#{variable} inasistencia"
    end
    end

    puts ''
  elsif opcion == 3

  aprobados(listado_de_alumnos)

    puts ''
  elsif opcion == 4 #Termina el programa
    #Salir
  else
    puts "La opcion ingresada no es valida\n"
  end

  menu
  puts 'Ingrese una de las 4 opciones:'
  opcion = gets.chomp.to_i
end
puts 'Adios'
