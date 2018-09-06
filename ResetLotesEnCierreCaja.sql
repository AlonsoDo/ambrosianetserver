Update lotes l Inner Join facturas f 
on (f.Sesion = 1 and l.NombCuen = f.Nombre and f.Estado = 'C')
set l.Sesion = 0