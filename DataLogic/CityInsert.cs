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
    
    
    public class CityInsert : BaseExecute
    {
        
        private SqlParameter paraCityID;
        
        public int CityID
        {
            get
            {
return (System.Int32)this.paraCityID.Value;
            }
            set
            {
this.paraCityID.Value = value;
            }
        }
        
        private SqlParameter paraCityName;
        
        public string CityName
        {
            get
            {
return (System.String)this.paraCityName.Value;
            }
            set
            {
this.paraCityName.Value = value;
            }
        }
        
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
        
        private SqlParameter paraKeys;
        
        public string Keys
        {
            get
            {
return (System.String)this.paraKeys.Value;
            }
            set
            {
this.paraKeys.Value = value;
            }
        }
        
        public CityInsert()
        {
base.InitCommand("CityInsert");
ConfigParameter();
        }
        
        #region 存储过程参数赋值
        public void ConfigParameter()
        {
//--------------------------------------------------------
this.paraCityID = new SqlParameter();
this.paraCityID.ParameterName = "@CityID";
this.paraCityID.SqlDbType = SqlDbType.Int;
this.paraCityID.Size = 4;
this.paraCityID.Direction = ParameterDirection.Output;
base.m_cmd.Parameters.Add(this.paraCityID);
//--------------------------------------------------------
this.paraCityName = new SqlParameter();
this.paraCityName.ParameterName = "@CityName";
this.paraCityName.SqlDbType = SqlDbType.VarChar;
this.paraCityName.Size = 50;
this.paraCityName.Direction = ParameterDirection.Input;
this.paraCityName.Value=DBNull.Value;
base.m_cmd.Parameters.Add(this.paraCityName);
//--------------------------------------------------------
this.paraProID = new SqlParameter();
this.paraProID.ParameterName = "@ProID";
this.paraProID.SqlDbType = SqlDbType.Int;
this.paraProID.Size = 4;
this.paraProID.Direction = ParameterDirection.Input;
this.paraProID.Value=DBNull.Value;
base.m_cmd.Parameters.Add(this.paraProID);
//--------------------------------------------------------
this.paraKeys = new SqlParameter();
this.paraKeys.ParameterName = "@Keys";
this.paraKeys.SqlDbType = SqlDbType.VarChar;
this.paraKeys.Size = 2;
this.paraKeys.Direction = ParameterDirection.Input;
this.paraKeys.Value=DBNull.Value;
base.m_cmd.Parameters.Add(this.paraKeys);
        }
        #endregion
    }
}
