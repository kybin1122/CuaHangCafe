using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
namespace QuanLyCaPhe.DTO
{
    public class Bill
    {
        public Bill(int ID, DateTime? dateCheackIn, DateTime? dateCheackOut, int Status)
        {

            this.ID = iD;
            this.DateCheackIn = dateCheackIn;
            this.DateCheackOut = dateCheackOut;
            this.status = Status;

        }

        public Bill(DataRow row)
        {
            this.ID = (int)row["id"];
            this.DateCheackIn = (DateTime?)row["dateCheackIn"];
            var dateCheackOutTemp = row["dateCheackOut"];
            if(dateCheackOutTemp.ToString()  != "")

            this.DateCheackOut = (DateTime?)dateCheackOutTemp;
            this.status = (int)row["Status"];
        }


        private int status;
        public int Status
        {
            get { return status; }
            set { status = value; }
        }


        private DateTime? dateCheackIn;
        public DateTime? DateCheackIn
        {
            get { return dateCheackIn; }
            set { dateCheackIn = value; }
        }
        private DateTime? dateCheackOut;
        public DateTime? DateCheackOut
        {
            get { return dateCheackOut; }
            set { dateCheackOut = value; }
        }

        private int iD;

        public int ID
        {
            get { return iD; }
            set { iD = value; }
        }

    }
}
