<!doctype html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>


    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        body {
            background-color: black;

        }

        .faq {
            margin: 50px;
            padding: 50px;
            background-color: black;
            opacity: 1;
        }

        .coment {
            font-family: Arial;
            font-size: 15px;
        }
    </style>
    <link rel="stylesheet" href="support.css">
</head>
<body>
<div>
    <header class="showcase">
        <div class="showcase-top">
            <img src="https://i.ibb.co/r5krrdz/logo.png" alt=""/>
            <a href="#" class="btn btn-rounded">Sign In</a>
        </div>
        <div class="showcase-content">
            <h1>See what's next</h1>
            <p>Watch anywhere. Cancel Anytime</p>

        </div>
    </header>
    <!--    <section class="tabs">-->
    <!--        <div class="container">-->
    <!--            <div id="tab-1" class="tab-item tab-border">-->
    <!--                <i class="fas fa-door-open fa-3x"></i>-->
    <!--                <p class="hide-sm">Điền Khoản sử dụng</p>-->
    <!--            </div>-->
    <!--            <div id="tab-2" class="tab-item">-->
    <!--                <i class="fas fa-tablet-alt fa-3x"></i>-->
    <!--                <p class="hide-sm">Watch anywhere</p>-->
    <!--            </div>-->
    <!--            <div id="tab-3" class="tab-item">-->
    <!--                <i class="fas fa-tags fa-3x"></i>-->
    <!--                <p class="hide-sm">Pick your price</p>-->
    <!--            </div>-->
    <!--        </div>-->
    <!--    </section>-->
    <!--    <section class="tab-content">-->
    <!--        <div class="container">-->
    <!--            &lt;!&ndash; Tab Content 1 &ndash;&gt;-->
    <!--            <div id="tab-1-content" class="tab-content-item show">-->
    <!--                <div class="tab-1-content-inner">-->
    <!--                    <div>-->
    <!--                        <p class="text-lg">-->
    <!--                            If you decide Netflix isn't for you - no problem. No commitment.-->
    <!--                            Cancel online anytime.-->
    <!--                        </p>-->
    <!--                        <a href="#" class="btn btn-lg">Watch Free For 30 Days</a>-->
    <!--                    </div>-->
    <!--                    <img src="https://i.ibb.co/J2xDJV7/tab-content-1.png" alt="" />-->
    <!--                </div>-->
    <!--            </div>-->

    <!--            &lt;!&ndash; Tab Content 2 &ndash;&gt;-->
    <!--            <div id="tab-2-content" class="tab-content-item">-->
    <!--                <div class="tab-2-content-top">-->
    <!--                    <p class="text-lg">-->
    <!--                        Watch TV shows and movies anytime, anywhere — personalized for-->
    <!--                        you.-->
    <!--                    </p>-->
    <!--                    <a href="#" class="btn btn-lg">Watch Free For 30 Days</a>-->
    <!--                </div>-->
    <!--                <div class="tab-2-content-bottom">-->
    <!--                    <div>-->
    <!--                        <img src="https://i.ibb.co/DpdN7Gn/tab-content-2-1.png" alt="" />-->
    <!--                        <p class="text-md">-->
    <!--                            Watch on your TV-->
    <!--                        </p>-->
    <!--                        <p class="text-dark">-->
    <!--                            Smart TVs, PlayStation, Xbox, Chromecast, Apple TV, Blu-ray-->
    <!--                            players and more.-->
    <!--                        </p>-->
    <!--                    </div>-->
    <!--                    <div>-->
    <!--                        <img src="https://i.ibb.co/R3r1SPX/tab-content-2-2.png" alt="" />-->
    <!--                        <p class="text-md">-->
    <!--                            Watch instantly or download for later-->
    <!--                        </p>-->
    <!--                        <p class="text-dark">-->
    <!--                            Available on phone and tablet, wherever you go.-->
    <!--                        </p>-->
    <!--                    </div>-->
    <!--                    <div>-->
    <!--                        <img src="https://i.ibb.co/gDhnwWn/tab-content-2-3.png" alt="" />-->
    <!--                        <p class="text-md">-->
    <!--                            Use any computer-->
    <!--                        </p>-->
    <!--                        <p class="text-dark">-->
    <!--                            Watch right on Netflix.com.-->
    <!--                        </p>-->
    <!--                    </div>-->
    <!--                </div>-->
    <!--            </div>-->

    <!--            &lt;!&ndash; Tab Content 3 &ndash;&gt;-->
    <!--            <div id="tab-3-content" class="tab-content-item">-->
    <!--                <div class="text-center">-->
    <!--                    <p class="text-lg">-->
    <!--                        Choose one plan and watch everything on Netflix.-->
    <!--                    </p>-->
    <!--                    <a href="#" class="btn btn-lg">Watch Free For 30 Days</a>-->
    <!--                </div>-->

    <!--                <table class="table">-->
    <!--                    <thead>-->
    <!--                    <tr>-->
    <!--                        <th></th>-->
    <!--                        <th>Basic</th>-->
    <!--                        <th>Standard</th>-->
    <!--                        <th>Premium</th>-->
    <!--                    </tr>-->
    <!--                    </thead>-->
    <!--                    <tbody>-->
    <!--                    <tr>-->
    <!--                        <td>Monthly price after free month ends on 6/19/19</td>-->
    <!--                        <td>$8.99</td>-->
    <!--                        <td>$12.99</td>-->
    <!--                        <td>$15.99</td>-->
    <!--                    </tr>-->
    <!--                    <tr>-->
    <!--                        <td>HD Available</td>-->
    <!--                        <td><i class="fas fa-times"></i></td>-->
    <!--                        <td><i class="fas fa-check"></i></td>-->
    <!--                        <td><i class="fas fa-check"></i></td>-->
    <!--                    </tr>-->
    <!--                    <tr>-->
    <!--                        <td>Ultra HD Available</td>-->
    <!--                        <td><i class="fas fa-times"></i></td>-->
    <!--                        <td><i class="fas fa-times"></i></td>-->
    <!--                        <td><i class="fas fa-check"></i></td>-->
    <!--                    </tr>-->
    <!--                    <tr>-->
    <!--                        <td>Screens you can watch on at the same time</td>-->
    <!--                        <td>1</td>-->
    <!--                        <td>2</td>-->
    <!--                        <td>4</td>-->
    <!--                    </tr>-->
    <!--                    <tr>-->
    <!--                        <td>Watch on your laptop, TV, phone and tablet</td>-->
    <!--                        <td><i class="fas fa-check"></i></td>-->
    <!--                        <td><i class="fas fa-check"></i></td>-->
    <!--                        <td><i class="fas fa-check"></i></td>-->
    <!--                    </tr>-->
    <!--                    <tr>-->
    <!--                        <td>Unlimited movies and TV shows</td>-->
    <!--                        <td><i class="fas fa-check"></i></td>-->
    <!--                        <td><i class="fas fa-check"></i></td>-->
    <!--                        <td><i class="fas fa-check"></i></td>-->
    <!--                    </tr>-->
    <!--                    <tr>-->
    <!--                        <td>Cancel anytime</td>-->
    <!--                        <td><i class="fas fa-check"></i></td>-->
    <!--                        <td><i class="fas fa-check"></i></td>-->
    <!--                        <td><i class="fas fa-check"></i></td>-->
    <!--                    </tr>-->
    <!--                    <tr>-->
    <!--                        <td>First month free</td>-->
    <!--                        <td><i class="fas fa-check"></i></td>-->
    <!--                        <td><i class="fas fa-check"></i></td>-->
    <!--                        <td><i class="fas fa-check"></i></td>-->
    <!--                    </tr>-->
    <!--                    </tbody>-->
    <!--                </table>-->
    <!--            </div>-->
    <!--        </div>-->
    <!--    </section>-->


    <!--    <section class="tab-content">-->
    <!--        <div class="container">-->
    <!-- Tab Content 1 -->
    <!--            <div id="tab-1-content" class="tab-content-item show">-->
    <!--                <div class="tab-1-content-inner">-->
    <!--                    <div>-->
    <!--                        <p class="text-lg">-->
    <!--                            If you decide Netflix isn't for you - no problem. No commitment.-->
    <!--                            Cancel online anytime.-->
    <!--                        </p>-->
    <!--                        <a href="#" class="btn btn-lg">Watch Free For 30 Days</a>-->
    <!--                    </div>-->
    <!--                    <img src="https://i.ibb.co/J2xDJV7/tab-content-1.png" alt="" />-->
    <!--                </div>-->
    <!--            </div>-->
</div>

<!--<div style="height: 30%">-->


<!--&lt;!&ndash;    <img src="Logo-Netflix1.gif" height="205" width="100%"/>&ndash;&gt;-->
<!--</div>-->
<div class="faq reveal active" style="
    margin-top: 0px;
    padding-top: 1px;">
    <h2>Văn hóa doanh nghiệp của Netflix</h2>
    <ul class="accordion">
        <li>
            <input type="radio" name="accordion" id="first">
            <label for="first">Culture Deck - Tuyên ngôn văn hóa doanh nghiệp “độc - lạ”</label>
            <div class="content">
                <p>“Netflix Culture Deck” là bộ tài liệu về văn hóa doanh nghiệp của Netflix được công bố rộng rãi lần
                    đầu năm 2009 và ngay lập tức trở thành một trong những tài liệu nhân sự có tầm ảnh hưởng nhất trên
                    thế giới.</p>
                <p>Bên cạnh những giá trị cốt lõi, bộ tài liệu này đề cập đến những kỳ vọng của công ty đối với nhân
                    viên, các chế độ phúc lợi và đặc quyền của nhân viên khi làm việc tại Netflix.</p>
                <p>Dù thuộc “top” những công ty công nghệ có mức lương cao trên thị trường, Netflix quan điểm những phúc
                    lợi hoặc đặc quyền về tài chính không quyết định hạnh phúc cho nhân viên.</p>
                <p>Yếu tố này thậm chí không được đề cập trong tuyên ngôn văn hóa của công ty. Thay vào đó, tuyên ngôn
                    văn hóa của Netflix đề cao: “Phiên bản môi trường làm việc lý tưởng của chúng tôi không bao gồm
                    những bữa trưa sushi, phòng tập gym tuyệt vời, văn phòng sang trọng hay tiệc tùng thường xuyên. Môi
                    trường làm việc tuyệt vời với chúng tôi là xây dựng được một đội ngũ trong mơ cùng hướng tới một mục
                    tiêu chung đầy tham vọng”.</p>

            </div>
        </li>
        <li>
            <input type="radio" name="accordion" id="second">
            <label for="second">Xây dựng đội ngũ làm việc lý tưởng</label>
            <div class="content">
                <p>Việc xây dựng đội nhóm làm việc tốt luôn là ưu tiên hàng đầu tại Netflix. Theo đó, một đội ngũ lý
                    tưởng là khi các thành viên có thể phối hợp hiệu quả, truyền cảm hứng sáng tạo cho nhau, từ đó giúp
                    tăng năng suất công việc và mang lại kết quả vượt trội hơn.</p>
                <p>Không bất chấp để chiêu mộ nhân tài như các công ty công nghệ khác, Netflix không chào đón sự xuất
                    hiện của các “brilliant jerk” (cụm từ chỉ những người tài năng nhưng thái độ không tốt). Đối với họ,
                    đối tượng này chính là kẻ phá đám trong các hoạt động nhóm và công ty sẽ không bao giờ lãng phí
                    nguồn lực cho những nhân viên “lắm tài nhiều tật” này. Đội ngũ làm việc trong mơ mà Netflix hướng
                    tới là một tập thể mà các thành viên đều làm tốt nhất công việc mà họ đảm nhiệm.</p>
            </div>
        </li>
        <li>
            <input type="radio" name="accordion" id="third">
            <label for="third">Chỉ tuyển những “người trưởng thành”</label>
            <div class="content">
                <p>“Tự do và trách nhiệm” là cụm từ được nhấn mạnh xuyên suốt bộ tài liệu về văn hóa doanh nghiệp của
                    Netflix. Nguyên tắc này bắt nguồn từ việc Netflix cho rằng công ty dành quá nhiều thời gian và tiền
                    bạc vào việc xây dựng và thực thi các chính sách nhân sự chỉ để đối phó với 3% lực lượng lao động
                    thiếu ý thức tự giác làm việc, trong khi 97% còn lại sẽ tự động làm tốt công việc của mình.</p>
                <p>Netflix xem nhân viên của mình là những “người trưởng thành”. Họ cho nhân viên quyền tự chủ cao trong
                    công việc, đồng thời cũng yêu cầu một tinh thần trách nhiệm cao. Cụ thể, nhân viên của Netflix không
                    bị giới hạn số ngày nghỉ phép và họ cũng không bị gò bó bởi các quy trình thanh toán rườm rà cho các
                    chi phí công tác, đi lại; miễn sao họ luôn đặt lợi ích của công ty lên trên và sử dụng tiền của công
                    ty như tiền của chính mình. Netflix cũng nhấn mạnh họ coi trọng con người hơn quy trình. Nếu có thể
                    giải quyết các vấn đề một cách logic và đem lại hiệu quả cao thì khi đó quy trình không còn cần
                    thiết nữa.</p>
                <p>Netflix cho rằng việc cố gắng quản lý và cải thiện hiệu suất công việc hằng năm bằng cách đặt ra các
                    kế hoạch hay quy trình phức tạp là không cần thiết. Thay vào đó, họ yêu cầu lãnh đạo và quản lý của
                    công ty phải có những cuộc đối thoại trung thực với nhân viên của mình về hiệu suất công việc. Thậm
                    chí, Netflix sẵn sàng chi trả những gói trợ cấp thôi việc hào phóng để những nhân viên mà họ cảm
                    thấy không phù hợp với công ty tìm cho mình những cơ hội khác.</p>
            </div>
        </li>
        <li>
            <input type="radio" name="accordion" id="four">
            <label for="four">Triết lý giá trị của Netflix</label>
            <div class="content">
                <p>Netflix luôn tâm niệm rằng giá trị công ty không phải là những gì chúng ta nói ra, mà là những gì
                    chúng ta thực hiện. Netflix sử dụng mười giá trị này để ghi nhận và khen thưởng những nhân viên xuất
                    sắc. Nội dung các giá trị này được tóm lược ngắn gọn như sau:</p>
                <p class="coment">Phán đoán và ra quyết định: Đưa ra quyết định khôn ngoan, xác định nguyên nhân gốc
                    rễ thay vì chỉ
                    xử
                    lý bề nổi, suy nghĩ một cách chiến lược và rõ ràng những gì bạn đang cố gắng đạt được.</p>
                <p class="coment">Giao tiếp: Lắng nghe cẩn thận tốt hơn là phản ứng nhanh, ngắn gọn và rõ ràng trong
                    lời nói và
                    viết,
                    giữ bình tĩnh trong các tình huống căng thẳng và đối xử với mọi người bằng sự tôn trọng bất kể địa
                    vị hoặc sự khác biệt về quan điểm.</p>
                <p class="coment">Tầm ảnh hưởng: Hoàn thành tốt công việc với hiệu suất cao, tập trung vào kết quả
                    hơn là quá
                    trình.</p>
                <p class="coment">Sự tò mò: Học hỏi nhanh chóng, am hiểu về doanh nghiệp và ngành, đóng góp nhiều
                    hơn ngoài chuyên
                    môn của bạn.</p>
                <p class="coment">Đổi mới: Nhận thức lại các vấn đề để khám phá các giải pháp thực tế, thách thức
                    các giả định và
                    đề xuất các cách tiếp cận mới, giảm thiểu sự phức tạp và tìm thời gian để đơn giản hóa.</p>
                <p class="coment">Dũng cảm: Nói những gì bạn nghĩ, ngay cả khi nó gây tranh cãi, đưa ra quyết định
                    phức tạp, chấp
                    nhận rủi ro một cách thông minh, đặt câu hỏi về những hành động không phù hợp với giá trị của bản
                    thân.</p>
                <p class="coment">Niềm đam mê: Truyền cảm hứng cho người khác, ăn mừng chiến thắng, kiên trì và quan
                    tâm sâu sắc
                    đến thành công của công ty.</p>
                <p class="coment">Trung thực: Trực tiếp nhưng không công kích khi bất đồng quan điểm với người khác,
                    chỉ nói những
                    điều về đồng nghiệp mà bạn muốn nói thẳng với họ, nhanh chóng nhận ra những sai sót.</p>
                <p class="coment">Vị tha: Tìm kiếm những gì tốt nhất cho công ty, không phải cho bản thân hay nhóm
                    của bạn. Hãy bớt
                    cái tôi, dành thời gian giúp đỡ đồng nghiệp và chia sẻ thông tin một cách cởi mở và chủ
                    động.</p>
                <p class="coment">Văn hóa doanh nghiệp mạnh thường có yêu cầu cao và nó không dành cho tất cả mọi người.
                    Đối với
                    Netflix, sự trung thực được xem là yếu tố trọng tâm trong văn hóa doanh nghiệp của họ. Công ty được
                    xây dựng dựa trên các đội nhóm có sự kết nối chặt chẽ, luôn hướng tới hiệu suất với ý thức tự chủ và
                    lòng trung thành mạnh mẽ. </p>
            </div>
        </li>
        <li>
            <input type="radio" name="accordion" id="five">
            <label for="five">Cách Netflix hoạt động</label>
            <div class="content">
                <p>Netflix có một thư viện phong phú gồm các phim truyện, phim tài liệu, chương trình truyền hình,
                    anime, tác phẩm giành giải thưởng của Netflix và nhiều nội dung khác. Xem không giới hạn bất cứ lúc
                    nào bạn muốn.</p>
            </div>
        </li>
        <li>
            <input type="radio" name="accordion" id="six">
            <label for="six">Cách Netflix xây dựng con người</label>
            <div class="content">
                <p class="coment">Cách Netflix xây dựng con người bàn về cách xây dựng văn hóa làm việc tại Netflix để
                    tuyển được những
                    nhân viên giỏi giang, đồng lòng dù phải đối mặt với sự cạnh tranh khốc liệt. Mở đầu, tác giả Patty
                    McCord – Cựu giám đốc nhân sự Netflix – giới thiệu cách tiếp cận kiểu làm việc mới: “trói buộc” nhân
                    viên bằng tự do và trách nhiệm.</p>
                <p class="coment">Sau đó tác giả đặt câu hỏi đâu là động lực to lớn nhất của nhân viên và phải đối đãi
                    với nhân viên
                    như thế nào, trao đổi, cung cấp thông tin cho họ đến đâu.</p>
                <p class="coment">Độc giả sẽ cùng tìm hiểu xem làm thế nào để đề cao tính trung thực triệt để trong môi
                    trường công sở,
                    thúc đẩy sự tranh luận sôi nổi của mọi người và hướng tất cả liên tục tập trung vào tương lai ra sao
                    để đưa doanh nghiệp đi tới thành công. Không chỉ là tìm người phù hợp với từng vị trí, các vấn đề
                    nhạy cảm như lương thưởng cũng như cho thôi việc, chuyển việc cũng được xem xét tới.</p>
                <p class="coment">Đây là một cuốn sách đáng đọc cho những người muốn tìm hiểu về thành công của Netflix
                    cũng như muốn
                    xây dựng được một văn hóa doanh nghiệp phù hợp với tầm nhìn của mình.
                    Làm giám đốc nhân sự tại Netflix trong mười bốn năm, Patty McCord là người giúp tạo ra “Kim chỉ nam
                    văn hóa Netflix” (Netflix Culture Deck). kể từ khi được đăng tải lần đầu tiên trên Internet, “Kim
                    chỉ nam” này đã có hơn 15 triệu lượt xem.</p>
                <p class="coment">Sheryl Sandberg đã cho rằng “đây có thể là tài liệu quan trọng nhất từng ‘được mang
                    ra’ khỏi thung
                    lũng Silicon”. Patty tham gia vào những lần phát hành cổ phiếu ra công chúng của Netflix, và trước
                    đó là tại Pure Atria Software. Bà từng làm việc tại Sun Microsystems, Borland và Seagate
                    Technologies, và hợp tác với nhiều công ty khởi nghiệp nhỏ.</p>
                <p class="coment">Bà từng làm về các mảng nhân sự, đa dạng hóa, truyền thông, và các vị trí nhân sự quốc
                    tế. Hiện tại,
                    Patty huấn luyện và tư vấn cho một nhóm nhỏ các công ty và doanh nhân về văn hóa và nghệ thuật lãnh
                    đạo. Bà cũng đi diễn thuyết cho các đội nhóm trên khắp thế giới.</p>
            </div>
        </li>
    </ul>
    <div>
        <div><img src="Logo-Netflix.gif" height="498" width="100%" style="flex: content; line-grid: match-parent"/>
        </div>
        <div>Điều khoản sử dụng của Netflix</div>
    </div>

    <small>Bạn cần muốn có ý kiến gì để thông tin chúng tôi</small>
    <form class="email-signup" onsubmit="return false;">
        <input type="email" placeholder="Email address" required="">
        <button type="submit">Bắt đầu</button>
    </form>
    <footer class="footer">
        <p>Questions? Call 1-866-579-7172</p>
        <div class="footer-cols">
            <ul>
                <li><a href="#">FAQ</a></li>
                <li><a href="#">Investor Relations</a></li>
                <li><a href="#">Ways To Watch</a></li>
                <li><a href="#">Corporate Information</a></li>
                <li><a href="#">Netflix Originals</a></li>
            </ul>
            <ul>
                <li><a href="#">Help Center</a></li>
                <li><a href="#">Jobs</a></li>
                <li><a href="#">Terms Of Use</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
            <ul>
                <li><a href="#">Account</a></li>
                <li><a href="#">Redeem Gift Cards</a></li>
                <li><a href="#">Privacy</a></li>
                <li><a href="#">Speed Test</a></li>
            </ul>
            <ul>
                <li><a href="#">Media Center</a></li>
                <li><a href="#">Buy Gift Cards</a></li>
                <li><a href="#">Cookie Preferences</a></li>
                <li><a href="#">Legal Notices</a></li>
            </ul>
        </div>

    </footer>
</div>
<script>
    // $(window).on("load", function () {
    //     $(window).scroll(function () {
    //         var windowBottom = $(this).scrollTop() + $(this).innerHeight();
    //         $(".faq").each(function () {
    //             /* Check the location of each desired element */
    //             var objectBottom = $(this).offset().top + $(this).outerHeight();
    //
    //             /* If the element is completely within bounds of the window, fade it in */
    //             if (objectBottom < windowBottom) { //object comes into view (scrolling down)
    //                 if ($(this).css("opacity") == 0) {
    //                     $(this).faq(500, 1);
    //                 }
    //             } else { //object goes out of view (scrolling up)
    //                 if ($(this).css("opacity") == 1) {
    //                     $(this).faq(500, 0);
    //                 }
    //             }
    //         });
    //     }).scroll(); //invoke scroll-handler on page-load
    // });
</script>
<script>
    const tabItems = document.querySelectorAll('.tab-item');
    const tabContentItems = document.querySelectorAll('.tab-content-item');

    // Select tab content item
    function selectItem(e) {
// Remove all show and border classes
        removeBorder();
        removeShow();
// Add border to current tab item
        this.classList.add('tab-border');
// Grab content item from DOM
<%--        const tabContentItem = document.querySelector(`#${this.id}-content`);--%>
// Add show class
        tabContentItem.classList.add('show');
    }

    // Remove bottom borders from all tab items
    function removeBorder() {
        tabItems.forEach(item => {
            item.classList.remove('tab-border');
        });
    }

    // Remove show class from all content items
    function removeShow() {
        tabContentItems.forEach(item => {
            item.classList.remove('show');
        });
    }

    // Listen for tab item click
    tabItems.forEach(item => {
        item.addEventListener('click', selectItem);
    });
</script>


</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>