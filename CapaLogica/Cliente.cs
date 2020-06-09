using System;
using System.Collections.Generic;
using System.Text;
using CapaDatos;
using System.Linq;



namespace CapaLogica
{
   public class Cliente
    {

        public static List<CapaDatos.CLIENTE> GetCLIENTESById(decimal identificacion) {

            CapaDatos.Entities entities = new Entities();
            var ClientesLista = entities.CLIENTE.Where(x => x.IDENTIFICACION == identificacion);
            return (List<CLIENTE>)ClientesLista;
        }
    }
}
