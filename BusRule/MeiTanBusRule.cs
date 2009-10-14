﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:2.0.50727.3053
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace BusRule
{
    using System;
    using System.Data;
    using System.Xml;
    using System.Reflection;
    using System.Data.SqlClient;
    using DataLogic;
    using BusEntity;
    using BusFacade;
    
    
    // [Transaction(TransactionOption.Required)]
    public class MeiTanBusRule
    {
        
        public MeiTanBusRule()
        {
        }
        
        #region 公有全局方法insert/update/delete
        // 添加由实体指定的一条记录 AddMeiTan
        public bool Add(MeiTanBusEntity obj)
        {
            return InsertEntity(obj);
        }
        
        // 修改由实体指定的一条记录 ModifyMeiTan
        public bool Modify(MeiTanBusEntity obj)
        {
            return UpdateEntity(obj);
        }
        
        // 物理删除由主键ID指定的一条记录 DeleteMeiTan
        public bool Delete(int ID)
        {
            MeiTanDelete exec = new MeiTanDelete();
            try
            {
                exec.ID = ID;
                exec.ExecNoQuery();
                return true;
            }
            catch (Exception ex)
            {
                //throw ex;
                return false;
            }
            finally
            {
                exec = null;
            }
        }
        #endregion
        
        #region 公有静态全局方法insert/update/delete
        // 公用静态方法，插入一条记录 InsertMeiTan
        public static bool InsertEntity(MeiTanBusEntity obj)
        {
            MeiTanInsert exec = new MeiTanInsert();
            try
            {
                exec.ReceiveParameter(obj);
                exec.ExecNoQuery();
                return true;
            }
            catch (Exception ex)
            {
                //throw ex;
                return false;
            }
            finally
            {
                obj = null;
            }
        }
        
        // 公用静态方法，修改一条记录 UpdateMeiTan
        public static bool UpdateEntity(MeiTanBusEntity obj)
        {
            if (obj == null || obj.IsEmpty)
            {
                return false;
            }
            MeiTanUpdate exec = new MeiTanUpdate();
            try
            {
                exec.ReceiveParameter(obj);
                exec.ExecNoQuery();
                return true;
            }
            catch (Exception ex)
            {
                //throw ex;
                return false;
            }
            finally
            {
                obj = null;
            }
        }
        
        // 公用静态方法，删除一条记录 DeleteMeiTan
        public static bool DeleteEntity(MeiTanBusEntity obj)
        {
            if (obj == null || obj.IsEmpty)
            {
                return false;
            }
            MeiTanDelete exec = new MeiTanDelete();
            try
            {
                exec.ReceiveParameter(obj);
                exec.ExecNoQuery();
                return true;
            }
            catch (Exception ex)
            {
                //throw ex;
                return false;
            }
            finally
            {
                obj = null;
            }
        }
        #endregion
    }
}