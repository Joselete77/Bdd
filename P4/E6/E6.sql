SET SERVEROUTPUT ON;

DECLARE

CURSOR fila is SELECT nombrecompleto, certidumbre FROM partidos, consultas_datos WHERE partidos.idpartido = consultas_datos.partido AND respuesta = 'Si' ORDER BY certidumbre DESC;

media FLOAT := 0;
contador NUMBER(8) := 0;
   /*NUMBER (3,0)Precisión de 3 y escala 0 (3 digitos (Los digitos incluyen 
   la suma de los de la parte entera y la parte decimal)y 0 decimales)*/
BEGIN

FOR tupla IN fila LOOP
    media := media + tupla.certidumbre;
    contador := contador + 1;
END LOOP;

media := round(media/contador, 3);

DBMS_OUTPUT.PUT_LINE('La media de la certidumbre es: '|| media);

FOR tupla IN fila LOOP
    IF tupla.certidumbre > media THEN
        DBMS_OUTPUT.PUT_LINE(tupla.nombrecompleto||', '|| tupla.certidumbre);
    END IF;
END LOOP;
END;