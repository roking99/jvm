<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<html>
<body>
<h2>当前线程快照</h2>
<div>
<%
    Map<Thread, StackTraceElement[]> allStackTraces = Thread.getAllStackTraces();
    Iterator<Map.Entry<Thread, StackTraceElement[]>> iterator = allStackTraces.entrySet().iterator();
    while (iterator.hasNext()){
        Map.Entry<Thread, StackTraceElement[]> next = iterator.next();
        Thread key = next.getKey();
        if(key.equals(Thread.currentThread())){
            continue;
        }
        out.write("\n 线程:"+key.getName()+"\n");
        out.write("</br>");
        for (StackTraceElement stc :
                next.getValue()) {
            out.write("\t"+stc+"\n");
        }
        out.write("</br>");
        out.write("</br>");
    }
%>
</div>
</body>
</html>
