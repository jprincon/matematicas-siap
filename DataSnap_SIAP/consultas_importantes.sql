-- Obtener la lista de estudiantes inscritos a los talleres
select * from math_resumen_participante inner join math_participante_emem 
on math_resumen_participante.id_participante = math_participante_emem.cedula

-- Obtener la lista de participantes
select * from math_participante_emem where cedula = '1094935673' order by  nombre

-- actualizar un campo
update math_participante_emem set tipo_participacion='Ponente-Poster' where cedula = '1094935673'