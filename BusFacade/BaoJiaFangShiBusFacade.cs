﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行库版本:2.0.50727.1433
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace BusFacade
{
    using System;
    using System.Data;
    using System.Xml;
    using System.Reflection;
    using System.Data.SqlClient;
    using DataLogic;
    using BusEntity;
    
    
    public class BaoJiaFangShiBusFacade
    {
        
        public BaoJiaFangShiBusFacade()
        {
        }
        
        // 根据主键ID返回指定的BaoJiaFangShi实体
        public static BaoJiaFangShiBusEntity GetEntity(int ID)
        {
            BaoJiaFangShiByPK exec = new BaoJiaFangShiByPK();
            exec.ID = ID;
            BaoJiaFangShiBusEntity obj = new BaoJiaFangShiBusEntity();
            obj.MetaDataTable = exec.ExecDataTable();
            return obj;
        }
        
        // 返回所有BaoJiaFangShi
        public static DataTable GetList()
        {
            BaoJiaFangShiByAll exec = new BaoJiaFangShiByAll();
            return exec.ExecDataTable();
        }
    }
}
