using HouseWare.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HouseWare.Models.Dao
{
    public class UserDao
    {
        private HouseWare_Context db;
        
        public UserDao()
        {
            db = new HouseWare_Context();
        }

        public int login(string user,string pass)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName.Contains(user) && x.Password.Contains(pass));
            
            if (result == null)
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }
        public User getRow(int? id)
        {
            return db.Users.Find(id);
        }
        public User getRow(string username,int roles)
        {
            return db.Users.Where(m => m.IdRole == roles && m.UserName == username).FirstOrDefault();
        }
    }
}