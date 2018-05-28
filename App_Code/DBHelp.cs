using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public class DBHelper
{
    public DBHelper()
    {

    }
    public static SqlConnection GetSqlConnection()
    {
        string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        return sqlconn;
    }
    //查看影响行数
    public static int ReturnInflunceNumber(String sqlstr)
    {
        int count = 0;
        SqlConnection sqlconn = GetSqlConnection();
        SqlCommand sqlcommand = new SqlCommand();
        sqlcommand.Connection = sqlconn;
        sqlconn.Open();
        sqlcommand.CommandText = sqlstr;
        SqlDataReader sqlreader = sqlcommand.ExecuteReader();
        while (sqlreader.Read())
        {
            count++;
        }
        sqlcommand = null;
        sqlconn.Close();
        sqlconn = null;
        return count;
    }
    //获取dataset
    public static DataSet GetDataSet(String sqlstr, SqlConnection sqlconn)
    {
        SqlCommand sqlcommand = new SqlCommand(sqlstr, sqlconn);
        SqlDataAdapter sqldata = new SqlDataAdapter();
        sqldata.SelectCommand = sqlcommand;
        DataSet daset = new DataSet();
        sqldata.Fill(daset);
        return daset;
    }
    public static int AddInformation(String sqlstr)
    {
        int result = 0;
        SqlConnection sqlconn = GetSqlConnection();
        sqlconn.Open();
        SqlTransaction tran = sqlconn.BeginTransaction();
        SqlCommand sqlcommand = sqlconn.CreateCommand();
        sqlcommand.Transaction = tran;
        try
        {
            sqlcommand.CommandText = sqlstr;
            result = sqlcommand.ExecuteNonQuery();
            tran.Commit();
        }
        catch
        {
            tran.Rollback();
        }
        finally
        {
            sqlconn.Close();
            sqlconn.Dispose();
        }
        return result;
    }
    public static SqlDataReader GetSqlDataReader(String sqlstr, SqlConnection sqlconn)
    {
        SqlCommand sqlcommand = new SqlCommand();
        sqlcommand.Connection = sqlconn;
        sqlcommand.CommandText = sqlstr;
        SqlDataReader sqlreader = sqlcommand.ExecuteReader();
        return sqlreader;
    }
    public static void DLBind(DataList datalist, String sqlstr)
    {
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        DataSet daset = DBHelper.GetDataSet(sqlstr, sqlconn);
        datalist.DataSource = daset;
        datalist.DataBind();
        sqlconn.Close();
        sqlconn = null;
    }
    public static int Add_De_Upd(SqlConnection sqlconn, String sqlstr)
    {
        int result = 0;
        SqlTransaction tran = sqlconn.BeginTransaction();
        SqlCommand sqlcommand = sqlconn.CreateCommand();
        sqlcommand.Transaction = tran;
        try
        {
            sqlcommand.CommandText = sqlstr;
            result = sqlcommand.ExecuteNonQuery();
            tran.Commit();
        }
        catch
        {
            tran.Rollback();
        }
        finally
        {
            //sqlconn.Close();
            //sqlconn.Dispose();
        }
        return result;
    }
    public static int DELE_UPDA(String sqlstr)
    {
        int result = 0;
        SqlConnection sqlconn = GetSqlConnection();
        sqlconn.Open();
        SqlTransaction tran = sqlconn.BeginTransaction();
        SqlCommand sqlcommand = sqlconn.CreateCommand();
        sqlcommand.Transaction = tran;
        try
        {
            sqlcommand.CommandText = sqlstr;
            result = sqlcommand.ExecuteNonQuery();
            tran.Commit();
        }
        catch
        {
            tran.Rollback();
        }
        finally
        {
            sqlconn.Close();
            sqlconn.Dispose();
        }
        return result;
    }
    
}