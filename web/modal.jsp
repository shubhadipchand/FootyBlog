<%-- 
    Document   : modal
    Created on : 23-Jun-2023, 10:28:42 pm
    Author     : shubh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <!-- Modal -->
    <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Provide the modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            <div class="modal-body">
                <form id="add-post-form" action="AddPostServlet" method="POST" enctype="multipart/form-data">
                    
                    <div class="form-group">
                        <select class="form-control" name="cid">
                            <option selected disabled>---Select Category---</option>
                            
                            <% 
                            PostDao postd = new PostDao(ConnectionProvider.getConnection());
                            ArrayList<Category> list =postd.getAllCategories();
                            for(Category c:list)
                            {
                            %>
                            
                            <option value="<%= c.getCid() %>"><%= c.getName() %></option>
                            
                            <% 
                                }
                            %>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <input name="pTitle" type="text" placeholder="Enter post title" class="form-control" autocomplete="off">
                    </div>
                    
                    <div class="form-group">
                        <textarea name="pContent" class="form-control" style="height: 300px" placeholder="Enter your content"></textarea>
                    </div>
                        
                    <div class="form-group">
                        <input name="pPublisher" type="text" placeholder="Enter your name as the publisher of this post" class="form-control" autocomplete="off">
                    </div>    
                    
                    <div class="form-group">
                        <label>select your pic...</label>
                        <br>
                        <input type="file" name="pPic">
                    </div>
                        
                    <div class="container text-center">
                            <button type="submit" class="btn btn-outline-primary">Post</button>
                    </div>    
                    
                </form>
             </div>
        </div>
    </div> 
    </div>                    
        
        <!-- javascripts -->
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
        <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function(event) {
                    //this code gets called when form is submitted...
                    event.preventDefault();
                    let form = new FormData(this);
                    
                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function () {
                            //  success..
                                Swal.fire('Good job!','Your modal is posted','success');
                        },
                        error: function () {
                            // error..
                            Swal.fire({icon: 'error', title: 'Oops...',text: 'Something went wrong!'});
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>

