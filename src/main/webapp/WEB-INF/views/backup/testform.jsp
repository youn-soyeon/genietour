<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<br />
    <!-- Start Page Banner -->
    <div class="page-banner no-subtitle">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h2>Forms</h2>
          </div>
          <div class="col-md-6">
            <ul class="breadcrumbs">
              <li><a href="#">Home</a></li>
              <li>Forms</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- End Page Banner -->


    <!-- Start Content -->
    <div id="content">
      <div class="container">
        <div class="row sidebar-page">

          <!-- Page Content -->
          <div class="main col-md-9 page-content">

            <!-- Classic Heading -->
            <h4 class="classic-title"><span>Margo Forms System</span></h4>

            <!-- Forms start -->
            <form role="form" id="contactForm" data-toggle="validator" class="shake">
              <div class="controls">
                <input type="text" id="name" class="email" placeholder="Name" required data-error="Please enter your name">
                <div class="help-block with-errors"></div>
              </div>
              <div class="form-group">
                <div class="controls">
                  <input type="text" id="password" class="email" placeholder="Password" required data-error="Please enter your Password">
                  <div class="help-block with-errors"></div>
                </div>
              </div>
              <div class="form-group">
                <label for="exampleInputFile">File input</label>
                <input id="exampleInputFile" type="file">
                <p class="help-block">Example block-level help text here.</p>
              </div>
              <div class="checkbox">
                <label>
                  <input type="checkbox"> Check me out
                </label>
              </div>
              <button type="submit" id="submit" class="btn-system btn-large">Submit</button>
            </form>
            <div class="space-bottom"></div>
            <!-- Classic Heading -->
            <h4 class="classic-title"><span>Margo Inline form</span></h4>
<form class="form-inline" id="contactForm" role="form">
<div class="form-group">
<div class="controls">
<input type="email" class="email" id="email" placeholder="Email" required data-error="Please enter your email">
<div class="help-block with-errors"></div>
</div>
</div>
<div class="form-group">
<div class="controls">
<input type="email" class="email" id="email" placeholder="Email" required data-error="Please enter your email">
<div class="help-block with-errors"></div>
</div>
</div>
<div class="form-group">
<div class="controls">
<input type="email" class="email" id="email" placeholder="Password" required data-error="Please enter your email">
<div class="help-block with-errors"></div>
</div>
</div>
<div class="checkbox">
<label>
<input type="checkbox"> Remember me
</label>
</div>
<button type="submit" class="btn-system btn-large">Submit</button>
</form>
            <div class="space-bottom"></div>

            <!-- Classic Heading -->
            <h4 class="classic-title"><span>Margo Horizontal form</span></h4>
            <form class="form-horizontal" id="contactForm"  role="form">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                <div class="controls">
                  <input type="email" class="email" id="email" placeholder="Email" required data-error="Please enter your email">
                  <div class="help-block with-errors"></div>
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                <div class="controls">
                  <input type="password" class="email"  placeholder="Password" required data-error="Please enter your email">
                  <div class="help-block with-errors"></div>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox"> Remember me
                    </label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn-system btn-large">Submit</button>
                </div>
              </div>
            </form>
            <div class="space-bottom"></div>

            <!-- Classic Heading -->
            <h4 class="classic-title"><span>Margo Text Area</span></h4>
            <form id="contactForm" role="form">
              <label>Message</label>
              <div class="controls">
                <textarea id="message" rows="7" placeholder="Massage" required data-error="Write your message"></textarea>
                <div class="help-block with-errors"></div>
              </div>  
            </form>
            <div class="space-bottom"></div>

            <!-- Classic Heading -->
            <h4 class="classic-title"><span>Margo Validation states</span></h4>
            <form id="contactForm" role="form">
              <div class="form-group has-success">
                <div class="controls">
                  <label class="control-label" for="inputSuccess1">Input with success</label>
                  <input class="form-control" id="inputSuccess1" type="text">
                </div>
              </div>
              <div class="form-group has-warning">
                <div class="controls">
                  <label class="control-label" for="inputWarning1">Input with warning</label>
                  <input class="form-control" id="inputWarning1" type="text">
                </div>
              </div>
              <div class="form-group has-error">
                <div class="controls">
                  <label class="control-label" for="inputError1">Input with error</label>
                  <input class="form-control" id="inputError1" type="text">
                </div>
              </div>
            </form>
            <div class="space-bottom"></div>

            <!-- Classic Heading -->
            <h4 class="classic-title"><span>With optional icons</span></h4>
            <form  id="contactForm" role="form">
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group has-success has-feedback">
                    <label class="control-label" for="inputSuccess2">Input with success</label>
                    <div class="controls">
                      <input class="form-control" id="inputSuccess2" type="text">
                      <i class="fa fa-check form-control-feedback"></i>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group has-warning has-feedback">
                    <label class="control-label" for="inputWarning2">Input with warning</label>
                    <div class="controls">
                      <input class="form-control" id="inputSuccess2" type="text">
                      <i class="fa fa-warning form-control-feedback"></i>
                    </div>                    
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group has-error has-feedback">
                    <label class="control-label" for="inputError2">Input with error</label>
                    <div class="controls">
                      <input class="form-control" id="inputSuccess2" type="text">
                      <i class="fa fa-times form-control-feedback"></i>
                    </div>                      
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group has-feedback">
                    <label class="control-label">Username</label>
                    <div class="controls">
                      <input class="form-control" id="inputSuccess2" type="text">
                       <i class="fa fa-user form-control-feedback"></i>
                    </div>                    
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group has-feedback">
                    <label class="control-label">Password</label>
                    <div class="controls">
                      <input class="form-control" id="inputSuccess2" type="text">
                       <i class="fa fa-lock form-control-feedback"></i>
                    </div>                     
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group has-feedback">
                    <label class="control-label">Email</label>
                    <div class="controls">
                      <input class="form-control" id="inputSuccess2" type="text">                       
                      <i class="fa fa-envelope-o form-control-feedback"></i>
                    </div> 
                  </div>
                </div>
              </div>
            </form>
          </div>
          <!-- End Page Content-->
          
          </div>
          </div>
          </div>
