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
    
    
    public class CityByProID : BaseExecute
    {
        
        private SqlParameter paraProID;
        
        public int ProID
        {
            get
            {
return (System.Int32)this.paraProID.Value;
            }
            set
            {
this.paraProID.Value = value;
            }
        }
        
        public CityByProID()
        {
base.InitCommand("CityByProID");
ConfigParameter();
        }
        
        #region 存储过程参数赋值
        public void ConfigParameter()
        {
//--------------------------------------------------------
this.paraProID = new SqlParameter();
this.paraProID.ParameterName = "@ProID";
this.paraProID.SqlDbType = SqlDbType.Int;
this.paraProID.Size = 4;
this.paraProID.Direction = ParameterDirection.Input;
this.paraProID.Value=DBNull.Value;
base.m_cmd.Parameters.Add(this.paraProID);
        }
        #endregion
    }
}
