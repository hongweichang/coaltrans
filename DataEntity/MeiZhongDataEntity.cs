﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行库版本:2.0.50727.1433
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataEntity
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Data.SqlTypes;
    using System.Xml;
    using System.Reflection;
    
    
    public class MeiZhongDataEntity : BaseEntity
    {
        
        public MeiZhongDataEntity()
        {
        }
        
        private int m_CoalClassID;
        
        public int CoalClassID
        {
            get
            {
return this.m_CoalClassID;
            }
            set
            {
this.m_CoalClassID = value;
            }
        }
        
        private string m_CoalClassName;
        
        public string CoalClassName
        {
            get
            {
return this.m_CoalClassName;
            }
            set
            {
this.m_CoalClassName = value;
            }
        }
    }
}