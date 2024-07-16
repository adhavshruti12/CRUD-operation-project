import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/info")
public class info extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        String takeaction = req.getParameter("takeaction");
        String roll_no = req.getParameter("roll_no");
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String gender = req.getParameter("gender");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Register_form", "root", "root");

            if ("ADD".equals(takeaction)) {
                // Generate a unique Roll No.
                Statement stmt = cn.createStatement();
                String query = "SELECT MAX(ROLL_NO) FROM info";
                ResultSet rs = stmt.executeQuery(query);
                int maxRollNo = 0;
                if (rs.next()) {
                    maxRollNo = rs.getInt(1);
                }
                maxRollNo++;
                roll_no = String.valueOf(maxRollNo);
                rs.close();
                stmt.close();

                PreparedStatement ps = cn.prepareStatement("INSERT INTO info(NAME, ROLL_NO, ADDRESS, GENDER) VALUES (?, ?, ?, ?)");
                ps.setString(1, name);
                ps.setString(2, roll_no);
                ps.setString(3, address);
                ps.setString(4, gender);
                int insertedRows = ps.executeUpdate();
                if (insertedRows > 0) {
                    out.println("<script>alert('Record added successfully!')</script>");
                }
                ps.close();
            } else if ("UPDATE".equals(takeaction)) {
                PreparedStatement ps = cn.prepareStatement("UPDATE info SET NAME=?, ADDRESS=?, GENDER=? WHERE ROLL_NO=?");
                ps.setString(1, name);
                ps.setString(2, address);
                ps.setString(3, gender);
                ps.setString(4, roll_no);
                int updatedRows = ps.executeUpdate();
                if (updatedRows > 0) {
                    out.println("<script>alert('Record updated successfully!')</script>");
                }
                ps.close();
            } else if ("DELETE".equals(takeaction)) {
                PreparedStatement ps = cn.prepareStatement("DELETE FROM info WHERE ROLL_NO=?");
                ps.setString(1, roll_no);
                int deletedRows = ps.executeUpdate();
                if (deletedRows > 0) {
                    out.println("<script>alert('Record deleted successfully!')</script>");
                }
                ps.close();
            }

            cn.close();
        } catch (Exception e) {
            out.println(e);
        }

        resp.sendRedirect("index.jsp");
    }
}
