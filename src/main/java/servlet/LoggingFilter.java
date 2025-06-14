package servlet;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import java.io.IOException;

@WebFilter("/*")
public class LoggingFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
        throws IOException, ServletException {
        System.out.println("Requête interceptée : " + ((HttpServletRequest) request).getRequestURI());
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) {}
    public void destroy() {}
}
