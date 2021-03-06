<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="Dominio.Alumno" %>
        <%@ page import="Dominio.Curso" %>
    <%@ page import="java.util.ArrayList" %>
    
        <%@ page import="Dominio.Docente" %>
        <%@ page import="java.util.function.*" %>
<!DOCTYPE html>
<html>
<%@ page import="Servlets.MiServlet" %>

<% MiServlet.validarSesion(request,response);%>
<head>
<meta charset="ISO-8859-1">
  <link rel="stylesheet" href="Content/bootstrap.min.css">
   <script src="assets/js/bootstrap.min.js"></script>
  <script src="assets/js/bootstrap.js"></script>
  <script src="assets/js/popper.min.js"></script>
  
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <link href="assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
  
    <script type="text/javascript" src="assets/js/ControladorListado.js"></script>
  
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  
<title>TP Integrador</title>

</head>
<body>


<div class="sidebar" data-color="purple" data-background-color="white" data-image="assets/img/sidebar-1.jpg">

      <div class="logo">
        <a class="simple-text logo-normal active">
          DOCENTE
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">

<form id="FormDocenteDireccionar2" action="ServletDireccionarDocente" method="post" >
        	<li class="nav-item" >	
        	<% 
        	int IDDocente=-1;
        	if(request.getAttribute("IDDocente")!=null)
        		{
        		IDDocente= (int)request.getAttribute("IDDocente");
        		%>
			<input type="hidden"  value="<%=IDDocente %>" name="IDDocente" >
			<%} %>	
            <a type="submit" href="javascript:{}" onclick="document.getElementById('FormDocenteDireccionar2').submit()" class="nav-link"   >
              <i class="material-icons">content_paste</i>
              <p>Mis Cursos</p>
            </a>

          </li>
</form>

    
          
         
           <li class="nav-item ">
            <a class="nav-link" href="Login.jsp">
              <i class="material-icons">logout</i>
              <p>Salir</p>
            </a>
          </li>
          

        </ul>
      </div>
    </div>    

<div class="wrapper ">



	<div class="main-panel">
		<div class="container">


              <div class="card card-plain">
                <div class="card-header card-header-primary ">
                  <h4 class="card-title mt-0 text-center">Listado Cursos vigentes</h4>
               
                <div class="form-row align-items-center">
                <form id="formFiltroAnio" >
                <% 
                if(request.getAttribute("IDDocente")!=null){
                	IDDocente = (int)request.getAttribute("IDDocente"); %>
                <input type="hidden" name="IDDocente" value="<%=IDDocente %>" >
                	<%} %>
                	<select class="custom-select mr-sm-2" onchange="ListadoCursos()" data-size="5" id="FiltroAnio"  name="FiltroAnio">
                		<option value="0">
                		A�o  
                		</option>
                		<option value="2020">
                			2020
                		</option>
                		<option value="2019">
                			2019
                		</option>
                		<option value="2018">
                			2018
                		</option>
                		<option value="2017">
                			2017
                		</option>
                		
                	</select>
                </form>
                	</div>
                </div>
                <div class="card-body">
                <%
                
                if(request.getAttribute("ListaCursos")!=null)
                {
                	ArrayList<Curso> list = (ArrayList<Curso>) request.getAttribute("ListaCursos");
                
                %>
            <div class="table-responsive">
                    <table class="table table-hover">
                      <thead class="">
                        <th>
                          Materia
                        </th>
                        <th>
                          Semestre
                        </th>
                        <th>
                          A�o
                        </th>
                        
                       
                        <th>
                          Calificar Alumnos
                        </th>
                      </thead>
                      <tbody>

<%
int i=0;
for (Curso curso : list)
{
	i++;
	String x = "TablaVerCursos"+i;
%>
                <form id="<%= x %>">

                        <tr>
                        <input type="hidden" name="IDDocente" value="<%=IDDocente%>">
                          <input type="hidden" name="IDCurso" id="IDCurso" value="<%=curso.getID() %>" >
                          <td>
                          <%= curso.getMateria() %>
                          </td>
                          <td>
						<%= curso.getSemestre() %>
                          </td>
                          <td>
                         <%= curso.getAnio() %>
                          </td>
           
                      
                          <td>
                            <button type="submit" class="btn btn-primary" onclick="ListarAlumnosDeCurso(<%=i %>)" name="btnCalificarCurso" id="btnCalificarCurso" value="btnCalificarCurso"> X </button>

                          </td>
                        
                        </tr>
                  </form>
                      <%
                      }
                      %>


                      </tbody>
                    </table>
                  </div>
                  
                  <%
                  }
                  %>
                </div>

          </div>
          </div>
          </div>
       
   
              
              
            		</div>			
                   
                
                  
    <script type="text/javascript" src="assets/js/ControladorListado.js"></script>



</body>
</html>