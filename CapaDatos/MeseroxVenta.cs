using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
 public   class MeseroxVenta
    {

        public MeseroxVenta()
        {
            
        }

        public decimal IDDETALLEXFACTURA { get; set; }
        public decimal NROFACTURA { get; set; }
        public decimal VALOR { get; set; }
        public decimal IDMESERO { get; set; }
    }
}
