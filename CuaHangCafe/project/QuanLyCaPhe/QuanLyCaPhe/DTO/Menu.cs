using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyCaPhe.DTO
{
   public  class Menu
    {

        public Menu(string foodName, int count, float price, float Totalprice = 0)
        {

            this.FoodName = FoodName;
            this.Count = Count;
            this.Price = Price;
            this.TotalPrice = TotalPrice;

        }
        public Menu(DataRow row)
        {

            this.FoodName = (string)row["name"].ToString();
            this.Count = (int)row["Count"];
            this.price = (float)Convert.ToDouble(row["price"].ToString());
            this.TotalPrice = (float)Convert.ToDouble(row["TotalPrice"].ToString());

        }

        private string foodName;

        public string FoodName
        {
            get { return foodName; }
            set { foodName = value; }
        }
        private int count;
        public int Count
        {
            get { return count; }
            set { count = value; }
        }
        private float price;
        public float Price
        {
            get { return price; }
            set { price = value; }
        }
        private float totalPrice;
        public float TotalPrice
        {
            get { return totalPrice; }
            set { totalPrice = value; }
        }
    }
}
