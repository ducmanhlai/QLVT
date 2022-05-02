using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;

namespace QuanLyVatTu
{
    /*
    * Lý do bắt buộc phải viết biến tại đây là chỉ khi ta mở form
    * thì các biến nằm trong form đó mới hình thành, dù biến đó có tầm hoạt 
    * động toàn dự án nhưng khi cái form nào đóng lại thì các biến cũng biến mất
    * Do đó, form khác sẽ không hiểu các biến của form đã đóng nữa. Để phục vụ nhu cầu
    * xuyên suốt thì phải khai báo tại đây
    * 
    * Data Source= DESKTOP-2HMOH0N: tên server chủ
    * Initial Catalog=QLVT: tên cơ sở dữ liệu
    * Integrated Security=true: đăng nhập với chế độ Window Authentication
    * 
    * public static = biến toàn cục dự án
    */
    static class Program
    {
        /**********************************************
         * con: biến để kết nối tới cơ sở dữ liệu
         * connectionString: connection String , chuỗi kết nối động
         * dataReader: 
         **********************************************/
        public static SqlConnection con = new SqlConnection();
        public static string connectionString = "";
        // lấy danh sách server phân mảnh.
        public static string connectionStringPublisher = "Data Source = DESKTOP-2HMOH0N; Initial Catalog = QLVT; Integrated Security = true";
        public static SqlDataReader srd; // myRead

        /**********************************************
         * serverName: tên server sẽ kết nối tới
         * userName: tên userName
         * password: mật khẩu
         * loginName: tên đăng nhập
         * password: mật khẩu
        **********************************************/

        public static string serverName = "";
        public static string userName = "";
        public static string database = "QLVT";
        public static string loginName = "";
        public static string password = "";


        public static string remoteLogin = "HTKN"; // Để khi đã đăng nhập vào server phân mảnh và muốn 
        public static string remotePassword = "123456"; // truy cập qua sv phân mảnh khác bằng tài khoản HTKN


        /*
         * role: tên nhóm quyền truy cập: CongTy-ChiNhanh-User.
         */
        public static string role;
        public static string nameNV;
        public static int CN;
        /*các form của toàn dữ án cũng được coi như 1 một biến toàn cục*/
        public static FormMain formMain;
        public static FormNhanVien formNhanVien;
        public static FormDangNhap formDangNhap;

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {  

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FormNhanVien());
        }
    }
}
