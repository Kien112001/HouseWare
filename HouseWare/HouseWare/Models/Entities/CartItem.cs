using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HouseWare.Models.Entities
{
    public class CartItem
    {
        public int C_ProductID { get; set; }
        public string C_Name { get; set; }
        public string C_Img { get; set; }
        public decimal C_Price { get; set; }
        public int C_Qty { get; set; }
        public decimal C_Amount { get; set; }
        public CartItem(int iD) { }
        public CartItem(int proid,string name,string img,decimal price,int qty) 
        {
            this.C_ProductID = proid;
            this.C_Name = name;
            this.C_Img = img;
            this.C_Price = price;
            this.C_Qty = qty;
            this.C_Amount = price * qty;
        }

       
    }
}