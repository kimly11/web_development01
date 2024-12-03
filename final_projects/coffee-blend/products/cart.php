<?php
// Start output buffering
ob_start();

require "../includes/header.php"; 
require "../config/config.php"; 

if (!isset($_SESSION['user_id'])) {
    header("location: " . APPURL);
    exit(); // Ensure no further code is executed
}

$products = $conn->prepare("SELECT * FROM cart WHERE user_id = :user_id");
$products->execute([':user_id' => $_SESSION['user_id']]);
$allProducts = $products->fetchAll(PDO::FETCH_OBJ);

// Cart total
$cartTotal = $conn->prepare("SELECT SUM(quantity * price) AS total FROM cart WHERE user_id = :user_id");
$cartTotal->execute([':user_id' => $_SESSION['user_id']]);
$allCartTotal = $cartTotal->fetch(PDO::FETCH_OBJ);

// Proceed to checkout
if (isset($_POST['checkout'])) {
    $_SESSION['total_price'] = $_POST['total_price'];
    header("location: checkout.php");
    exit(); // Ensure no further code is executed
}
?>

<section class="home-slider owl-carousel">
    <div class="slider-item" style="background-image: url(<?php echo APPURL; ?>/images/bg_3.jpg);" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row slider-text justify-content-center align-items-center">
                <div class="col-md-7 col-sm-12 text-center ftco-animate">
                    <h1 class="mb-3 mt-5 bread">Cart</h1>
                    <p class="breadcrumbs"><span class="mr-2"><a href="<?php echo APPURL; ?>">Home</a></span> <span>Cart</span></p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section ftco-cart">
    <div class="container">
        <div class="row">
            <div class="col-md-12 ftco-animate">
                <div class="cart-list">
                    <?php if (count($allProducts) > 0) : ?>
                        <table class="table">
                            <thead class="thead-primary">
                                <tr class="text-center">
                                    <th>&nbsp;</th>
                                    <th>&nbsp;</th>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($allProducts as $product) : ?>
                                    <tr class="text-center">
                                        <td class="product-remove"><a href="delete-product.php?id=<?php echo $product->id; ?>"><span class="icon-close"></span></a></td>
                                        <td class="image-prod"><div class="img" style="background-image:url(<?php echo IMAGEPRODUCTS; ?>/<?php echo $product->image; ?>);"></div></td>
                                        <td class="product-name">
                                            <h3><?php echo $product->name; ?></h3>
                                            <p><?php echo $product->description; ?></p>
                                        </td>
                                        <td class="price">$<?php echo $product->price; ?></td>
                                        <td>
                                            <div class="input-group mb-3">
                                                <input disabled type="text" name="quantity" class="quantity form-control input-number" value="<?php echo $product->quantity; ?>" min="1" max="100">
                                            </div>
                                        </td>
                                        <td class="total">$<?php echo $product->price * $product->quantity; ?></td>
                                    </tr>
                                <?php endforeach; ?>		
                            </tbody>
                        </table>
                    <?php else : ?>
                        <p>Your cart is empty, add products.</p>
                    <?php endif; ?>	
                </div>
            </div>
        </div>
        <div class="row justify-content-end">
            <div class="col col-lg-3 col-md-6 mt-5 cart-wrap ftco-animate">
                <div class="cart-total mb-3">
                    <h3>Cart Totals</h3>
                    <p class="d-flex">
                        <span>Subtotal</span>
                        <span>$<?php echo $allCartTotal->total; ?></span>
                    </p>
                    <p class="d-flex">
                        <span>Delivery</span>
                        <span>$2.00</span>
                    </p>
                    <p class="d-flex">
                        <span>Discount</span>
                        <span>$2.00</span>
                    </p>
                    <hr>
                    <p class="d-flex total-price">
                        <span>Total</span>
                        <?php if ($allCartTotal->total > 0) : ?>
                            <span>$<?php echo $allCartTotal->total + 2 - 2; ?></span>
                        <?php endif; ?>
                    </p>
                </div>
                <form method="POST" action="cart.php">
                    <input type="hidden" name="total_price" value="<?php echo $allCartTotal->total + 2 - 2; ?>">
                    <?php if ($allCartTotal->total > 0) : ?>	
                        <button style="background-color: black;" name="checkout" type="submit" class="btn btn-primary py-3 px-5">Proceed to Checkout</button>
                    <?php endif; ?>
                </form>
            </div>
        </div>
    </div>
</section>

<?php 
// Flush the output buffer and end the buffering
ob_end_flush();
require "../includes/footer.php"; 
?>