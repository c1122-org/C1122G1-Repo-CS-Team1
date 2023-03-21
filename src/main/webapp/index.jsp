<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/logo-title.png">
    <title>Netflix movie</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="./styles.css" />
</head>
<body>
<div class="header">
    <nav class="d-flex justify-content-between align-items-center pt-3 pb-3">
        <img src="./assets/images/logo.png" class="logo" />
        <div>
            <button>English</button>
            <a href="login">Login</a>
        </div>
    </nav>
    <div class="header-content">
        <h1 class="title-header-content">Unlimited TV shows, movies and more.</h1>
        <h3 class="fw-normal mb-3">Watch anywhere. Cancel anytime.</h3>
        <p>Ready to watch? Enter your email to create or restart your membership.</p>
        <form class="email-signup" onsubmit="return false;">
            <input type="email" placeholder="Email address" required>
            <button type="submit">Get Started</button>
        </form>
    </div>
</div>
<div class="features">
    <div class="row-feature reveal ">
        <div class="col-6 col-title mb-5">
            <h1>Enjoy on your TV.</h1>
            <h3  class="fw-normal mt-3">Watch on Smart TVs, Playstation, Xbox, Chromecast, Apple TV, Blu-ray players, and more.</h3>
        </div>
        <div class="col-6 col-img mb-5 d-flex justify-content-center">
            <img src="./assets/images/feature-1.png" alt="">
        </div>
    </div>
    <div class="row-feature reveal">
        <div class="col-6 col-img mb-5 d-flex justify-content-center">
            <img class="me-5" src="./assets/images/feature-2.png" alt="">
        </div>
        <div class="col-6 col-title mb-5">
            <h1>Download your shows to watch offline.</h1>
            <h3  class="fw-normal mt-3">Save your favorites easily and always have something to watch.</h3>
        </div>
    </div>
    <div class="row-feature reveal">
        <div class="col-6 col-title mb-5">
            <h1>Watch everywhere.</h1>
            <h3  class="fw-normal mt-3">Stream unlimited movies and TV shows on your phone, tablet, laptop, and TV.</h3>
        </div>
        <div class="col-6 col-img mb-5 d-flex justify-content-center">
            <img src="./assets/images/feature-3.png" alt="">
        </div>
    </div>
    <div class="row-feature reveal">
        <div class="col-6 col-img mb-5 d-flex justify-content-center">
            <img src="./assets/images/feature-4.png" alt="">
        </div>
        <div class="col-6 col-title mb-5">
            <h1>Create profiles for kids.</h1>
            <h3  class="fw-normal mt-3">Send kids on adventures with their favorite characters in a space made just for them—free with your membership.</h3>
        </div>
    </div>
</div>
<div class="faq reveal">
    <h2>Frequently Asked Questions</h2>
    <ul class="accordion">
        <li>
            <input type="radio" name="accordion" id="first">
            <label for="first">What is OneTeam?</label>
            <div class="content">
                <p>OneTeam is a streaming service that offers a wide variety of award-winning TV shows, movies, anime, documentaries, and more on thousands of internet-connected devices.</p>
                <p>You can watch as much as you want, whenever you want without a single commercial – all for one low monthly price. There's always something new to discover and new TV shows and movies are added every week!</p>
            </div>
        </li>
        <li>
            <input type="radio" name="accordion" id="second">
            <label for="second">How much does OneTeam cost?</label>
            <div class="content">
                <p>Watch OneTeam on your smartphone, tablet, Smart TV, laptop, or streaming device, all for one fixed monthly fee. Plans range from 70,000 ₫ to 260,000 ₫ a month. No extra costs, no contracts.</p>
            </div>
        </li>
        <li>
            <input type="radio" name="accordion" id="third">
            <label for="third">Where can I watch?</label>
            <div class="content">
                <p>Watch anywhere, anytime. Sign in with your OneTeam account to watch instantly on the web at oneteam.com from your personal computer or on any internet-connected device that offers the OneTeam app, including smart TVs, smartphones, tablets, streaming media players and game consoles.</p>
                <p>You can also download your favorite shows with the iOS, Android, or Windows 10 app. Use downloads to watch while you're on the go and without an internet connection. Take OneTeam with you anywhere.</p>
            </div>
        </li>
        <li>
            <input type="radio" name="accordion" id="four">
            <label for="four">How do I cancel?</label>
            <div class="content">
                <p>OneTeam is flexible. There are no pesky contracts and no commitments. You can easily cancel your account online in two clicks. There are no cancellation fees – start or stop your account anytime.</p>
            </div>
        </li>
        <li>
            <input type="radio" name="accordion" id="five">
            <label for="five">What can I watch on OneTeam?</label>
            <div class="content">
                <p>OneTeam has an extensive library of feature films, documentaries, TV shows, anime, award-winning OneTeam originals, and more. Watch as much as you want, anytime you want.</p>
            </div>
        </li>
        <li>
            <input type="radio" name="accordion" id="six">
            <label for="six">Is OneTeam good for kids?</label>
            <div class="content">
                <p>The OneTeam Kids experience is included in your membership to give parents control while kids enjoy family-friendly TV shows and movies in their own space.</p>
                <p>Kids profiles come with PIN-protected parental controls that let you restrict the maturity rating of content kids can watch and block specific titles you don’t want kids to see.</p>
            </div>
        </li>
    </ul>
    <small>Ready to watch? Enter your email to create or restart your membership.</small>
    <form class="email-signup" onsubmit="return false;">
        <input type="email" placeholder="Email address" required>
        <button type="submit">Get Started</button>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">
    window.addEventListener("scroll", reveal);
    function reveal() {
        var reveal = document.querySelectorAll(".reveal");
        for (let i = 0; i < reveal.length; i++) {
            var windowHeight = window.innerHeight;
            var revealTop = reveal[i].getBoundingClientRect().top;
            var revealPoint = 150;
            if (revealTop < windowHeight - revealPoint) {
                reveal[i].classList.add("active");
            }
            else {
                reveal[i].classList.remove("active");
            }
        }
    }
</script>
</body>
</html>
