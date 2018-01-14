SELECT elementos.ElementoId as `Elemento`, impresoraconfig.NombreImpresora as `NombreImp` 
FROM elementos JOIN impresoraconfig on elementos.ElementoId=impresoraconfig.ElementoId