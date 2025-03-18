import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/updateTask")
public class UpdateServlet extends HttpServlet {
    private TaskDAO taskDAO = new TaskDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int taskId = Integer.parseInt(req.getParameter("id"));
        boolean newStatus = !taskDAO.getTaskById(taskId).isStatus();

        taskDAO.updateTaskStatus(taskId, newStatus);
        resp.sendRedirect("displayTasks");
    }
}
