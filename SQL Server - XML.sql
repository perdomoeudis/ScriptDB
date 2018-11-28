--COUNT la cantidad de elementos Zoom

select COUNT(*) from @vxml.nodes('/Reverso/Zoom') T(c)

  
--SELECT el priemer elemento BackGround dentro de Reverso
  
select T.c.value('BackGround[1]', 'varchar(80)') from @vxml.nodes('/Reverso') T(c)

--CREAR xml a partir de una tabla con datos 
    --*PATH('Data') será el padre de cada registro
    --*ROOT('tDetail') será la raíz de todo el XML

declare @vxml xml
set @vxml = (
select top(5)* 
from production.ProductionOrder
for XML PATH('Data'), ROOT('tDetail'))
                           
--UPDATE 
DECLARE @res XML = '<Subject>English</Subject>
<Marks>67</Marks>
<Subject>Science</Subject>
<Marks>75</Marks>'


DECLARE @student XML = '<Student> 
   <Name>XYZ</Name>
   <Roll>15</Roll>
   <Result />
   <Attendance>50</Attendance>
</Student>'


SET @student.modify('insert sql:variable("@res") as first into (/Student/Result)[1]')
                           

