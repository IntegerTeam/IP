<%-- 
    Document   : fileupload
    Created on : Dec 18, 2017, 12:28:54 AM
    Author     : Ikmal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>File Upload</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form action="../uploadPicture" method="post" enctype="multipart/form-data"> <br><br>
            <table>
                <tr>
                    <td>UserName:  </td>
                    <td width='10px'></td>
                    <td><input type="text" name="unname"/></td>
                </tr>

                <tr>
                    <td>Upload: </td>
                    <td width='10px'></td>
                    <td><input type="file" name="filecover" value="Upload"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="submit"></td>
                </tr>
            </table>
        </form>
    </body>
</html>