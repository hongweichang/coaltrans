﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行库版本:2.0.50727.1433
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLogic
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Data.SqlTypes;
    using System.Xml;
    using System.Reflection;
    
    
    public class BaoJiaFangShiInsert : BaseExecute
    {
        
        private SqlParameter paraID;
        
        public int ID
        {
            get
            {
return (System.Int32)this.paraID.Value;
            }
            set
            {
this.paraID.Value = value;
            }
        }
        
        private SqlParameter paraBaojiafangshi;
        
        public string Baojiafangshi
        {
            get
            {
return (System.String)this.paraBaojiafangshi.Value;
            }
            set
            {
this.paraBaojiafangshi.Value = value;
            }
        }
        
        public BaoJiaFangShiInsert()
        {
base.InitCommand("BaoJiaFangShiInsert");
ConfigParameter();
        }
        
        #region 存储过程参数赋值
        public void ConfigParameter()
        {
//--------------------------------------------------------
this.paraID = new SqlParameter();
this.paraID.ParameterName = "@ID";
this.paraID.SqlDbType = SqlDbType.Int;
this.paraID.Size = 4;
this.paraID.Direction = ParameterDirection.Output;
base.m_cmd.Parameters.Add(this.paraID);
//--------------------------------------------------------
this.paraBaojiafangshi = new SqlParameter();
this.paraBaojiafangshi.ParameterName = "@Baojiafangshi";
this.paraBaojiafangshi.SqlDbType = SqlDbType.NVarChar;
this.paraBaojiafangshi.Size = 20;
this.paraBaojiafangshi.Direction = ParameterDirection.Input;
this.paraBaojiafangshi.Value=DBNull.Value;
base.m_cmd.Parameters.Add(this.paraBaojiafangshi);
        }
        #endregion
    }
}
