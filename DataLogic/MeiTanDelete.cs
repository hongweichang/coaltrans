﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:2.0.50727.3053
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
    
    
    public class MeiTanDelete : BaseExecute
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
        
        public MeiTanDelete()
        {
base.InitCommand("MeiTanDelete");
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
this.paraID.Direction = ParameterDirection.Input;
this.paraID.Value=DBNull.Value;
base.m_cmd.Parameters.Add(this.paraID);
        }
        #endregion
    }
}
