<?php require "includes/header.php"; ?>
<?php require "config/config.php"; ?>

    <section class="home-slider owl-carousel">

      <div class="slider-item" style="background-image: url(images/bg_3.jpg);" data-stellar-background-ratio="0.5">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">Contact Us</h1>
	            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Contact</span></p>
            </div>

          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section contact-section">
      <div class="container mt-5">
        <div class="row block-9">
					<div class="col-md-4 contact-info ftco-animate">
						<div class="row">
							<div class="col-md-12 mb-4">
	              <h2 class="h4">Contact Information</h2>
	            </div>
	            <div class="col-md-12 mb-3">
	              <p><span>Address:</span> ppiu, 168 st phnom penh</p>
	            </div>
	            <div class="col-md-12 mb-3">
	              <p><span>Phone:</span> <a href="tel://70923129">(+855) 70 913 129</a></p>
	            </div>
	            <div class="col-md-12 mb-3">
	              <p><span>Email:</span> <a href="kimlyjr11@gmail.com">kimlyjr11@gmail.com</a></p>
	            </div>
	            <div class="col-md-12 mb-3">
	              <p><span>Website:</span> <a href="#">ppiu.com</a></p>
	            </div>
						</div>
					</div>
					<div class="col-md-1"></div>
          <div class="col-md-6 ftco-animate">
            <form action="#" class="contact-form">
            	<div class="row">
            		<div class="col-md-6">
	                <div class="form-group">
	                  <input type="text" class="form-control" placeholder="Your Name">
	                </div>
                </div>
                <div class="col-md-6">
	                <div class="form-group">
	                  <input type="text" class="form-control" placeholder="Your Email">
	                </div>
	                </div>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Subject">
              </div>
              <div class="form-group">
                <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
              </div>
              <div class="form-group">
                <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>

    <!-- <div id="map"></div> -->
    <div id="map" style="height: 400px; width: 100%;"></div>

<script>
    function initMap() {
        var location = { 'https://maps.app.goo.gl/rAPMEAcGigwGxorTA' }; // Example: Phnom Penh coordinates
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 15,
            center: location
        });
        var marker = new google.maps.Marker({
            position: location,
            map: map
        });
    }
</script>

<!-- Google Maps API -->
<script async defer src="https://maps.app.goo.gl/rAPMEAcGigwGxorTA"></script>


<?php require "includes/footer.php"; ?>
