import com.conan.semi.board.free.FreeCommentDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;


@WebServlet("/FreeCommentUpdateC")
public class FreeCommentUpdateC extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String c_no = request.getParameter("c_no");
        String c_content = request.getParameter("c_content");

        FreeCommentDAO.updateComment(c_no, c_content);

        // 성공 상태 전송
        response.setStatus(HttpServletResponse.SC_OK);
    }
}

