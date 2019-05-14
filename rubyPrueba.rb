
def read_alum(file_name)
    file = File.open(file_name, 'r')
    alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
    file.close
    alum
end

 # print read_alum('alumnos.csv') # prueba que lee la wea

    selector_menu = 0

while selector_menu != 4

    puts 'Apreta 1 para opcion 1 = nombre de cada alumno y el promedio de sus notas'
    puts 'Apreta 2 para opcion 2 = nombre de cada alumno y la cantidad de inasistencias'
    puts 'Apreta 3 para opcion 3 = los nombres de los alumnos aprobados'
    puts 'Apreta 4 para Salir'

    selector_menu = gets.chomp.to_i

    if selector_menu == 1
        alumnos = read_alum('alumnos.csv')
        alumnos.each do |alumno| 
            puts "el alumno #{alumno[0]} tiene el siguiente promedio: "
            plus_sumador = 0
            alumno.each_with_index do |nota,index|
            plus_sumador += nota.to_f/5
            end
            puts plus_sumador
            
        end

    elsif selector_menu == 2     
        arregloalumno = []
        alumnos = read_alum('alumnos.csv') # llamando a caja grande
        puts 'los alumnos que tienen 1 inasitencia son'
        alumnos.each do |alumno| # cuando recorres la la caja grande, genera un caja
            
            
            alumno.each_with_index do |nota,index|
                
                arregloalumno.push(alumno[0]) if nota.to_i == 0 && index != 0
                
            
                
            end
            
            
        end
        puts arregloalumno 
        


    elsif selector_menu == 3
        alumnos = read_alum('alumnos.csv')
        alumnos.each do |alumno| 
            
            plus_sumador = 0
            alumno.each_with_index do |nota,index|
            plus_sumador += nota.to_f/5
            end
            if plus_sumador > 5.0
            puts "#{alumno[0]}"
            
            end
            
        end
        


    elsif selector_menu == 4
        puts 'Saliste'
    
    else
        puts 'No es valida es opción'
    end

end