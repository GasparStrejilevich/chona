pragma solidity ^0.8.10;

contract Estudiante
{
 string private  _nombre;
 string private  _apellido;
 string private  _curso;
 address private  _docente;
 mapping(string => uint8)private  notas_materias;
 string [] private SoyelMapa;

constructor(string memory name_, string memory apellido_, string memory curso_)
{
        _nombre = name_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
}
function apellido() public view returns (string memory)
{
        return _apellido;
}

function nombre_completo() public view returns (string memory)
{
        return string (bytes.concat(bytes(_nombre), " ", bytes(_apellido)));
}

function curso() public view returns (string memory)
{
    return _curso;
}

function set_nota_materia(uint8 nota, string memory materia) public 
{
 require(msg.sender == _docente);
 notas_materias[materia] = nota;
 SoyelMapa.push(materia);
}

function nota_materia(string memory materia) public view returns (uint)
{
 return notas_materias[materia];
}

function aprobo(string memory materia)  public view returns (bool)
{
if(notas_materias[materia] >= 60)
{
    return true;
}
else
{
    return false;
}


}
function promedio() public view returns(uint)
{
 uint Numero_de_materia= SoyelMapa.length;   
 uint tot = 0;
 for(uint8 i=0;Numero_de_materia>i;i++)
 {
    tot+=notas_materias[SoyelMapa[i]];

 }
 return tot/Numero_de_materia;
}
}