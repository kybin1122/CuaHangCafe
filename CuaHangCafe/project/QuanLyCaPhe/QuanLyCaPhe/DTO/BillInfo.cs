using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;


namespace QuanLyCaPhe.DTO
{
   public class BillInfo
    {

        public BillInfo(int ID, int billID, int FoodID, int Count)
        {

            this.ID = iD;
            this.billID = billId;
            this.FoodID = FoodId;
            this.Count = Count;

        }

        public BillInfo(DataRow row)
        {

            this.ID = (int)row["id"];
            this.billID = (int)row["idBill"];
            this.FoodID = (int)row["idFood"];
            this.Count = (int)row["Count"];

        }




        private int iD;

        public int ID
        {
            get { return iD; }
            set { iD = value; }
        }

        private int billID;

        public int billId
        {
            get { return billId; }
            set { billId = value; }
        }
        private int FoodID;

        public int FoodId
        {
            get { return FoodId; }
            set { FoodId = value; }
        }
        public int Count
        {
            get { return Count; }
            set { Count = value; }
        }
    }
}
