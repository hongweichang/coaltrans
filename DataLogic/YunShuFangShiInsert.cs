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
    
    
    public class YunShuFangShiInsert : BaseExecute
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
        
        private SqlParameter paraYunshufangshi;
        
        public string Yunshufangshi
        {
            get
            {
return (System.String)this.paraYunshufangshi.Value;
            }
            set
            {
this.paraYunshufangshi.Value = value;
            }
        }
        
        public YunShuFangShiInsert()
        {
base.InitCommand("YunShuFangShiInsert");
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
this.paraYunshufangshi = new SqlParameter();
this.paraYunshufangshi.ParameterName = "@Yunshufangshi";
this.paraYunshufangshi.SqlDbType = SqlDbType.NVarChar;
this.paraYunshufangshi.Size = 20;
this.paraYunshufangshi.Direction = ParameterDirection.Input;
this.paraYunshufangshi.Value=DBNull.Value;
base.m_cmd.Parameters.Add(this.paraYunshufangshi);
        }
        #endregion
    }
}
