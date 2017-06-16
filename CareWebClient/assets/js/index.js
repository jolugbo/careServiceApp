//$(document).ready(function () {

//    var animating = false,
//        submitPhase1 = 1100,
//        submitPhase2 = 400,
//        logoutPhase1 = 800,
//        $login = $(".login"),
//        $app = $(".app");

//function ripple(elem, e) {
//    $(".ripple").remove();
//    var elTop = elem.offset().top,
//        elLeft = elem.offset().left,
//        x = e.pageX - elLeft,
//        y = e.pageY - elTop;
//    var $ripple = $("<div class='ripple'></div>");
//    $ripple.css({ top: y, left: x });
//    elem.append($ripple);
//};
function validateLogin() {
    //var recaptcha = $("#g-recaptcha-response").val();
    //if (recaptcha === "") {
    //    event.preventDefault();
    //    alert("Please check the recaptcha");
    //}
}
function setValue() {
    var holder = 0;
    //if (recaptcha === "") {
    //    event.preventDefault();
    //    alert("Please check the recaptcha");
    //}
}
function validatePass() {
    //var pass1 = document.getElementById("#idtxtPassword1").value;
    var UserName = $("#txtUserName").val();
    var pass1 = $("#txtPassword1").val();
    var pass2 = $("#txtPassword2").val();

    re = /^\w+$/;
    if (!re.test(UserName)) {
        alert("Error: Username must contain only letters, numbers or underscores!");

        return false;
    }

    if (pass1 != "" && pass1 == pass2) {
        if (pass1.length < 6) {
            alert("Error: Password must contain at least six characters!");


            return false;
        }
        if (pass1 == UserName) {
            alert("Error: Password must be different from Username!");


            return false;
        }
        re = /[0-9]/;
        if (!re.test(pass1)) {
            alert("Error: password must contain at least one number (0-9)!");


            return false;
        }
        re = /[a-z]/;
        if (!re.test(pass1)) {
            alert("Error: password must contain at least one lowercase letter (a-z)!");

            return false;
        }
        re = /[A-Z]/;
        if (!re.test(pass1)) {
            alert("Error: password must contain at least one uppercase letter (A-Z)!");

            return false;
        }
    }
    else {
        alert("Error: password does not match");

        return false;
    }
    return true;
};
function ToJavaScriptDate(value) {
    var pattern = /Date\(([^)]+)\)/;
    var results = pattern.exec(value);
    var dt = new Date(parseFloat(results[1]));
    return dt.getDate() + "/" + (dt.getMonth() + 1) + "/" + dt.getFullYear();
}
function getRecord(current) {
    $.ajax({
        type: "POST",
        url: "wards.aspx/GetKidRecord",
        data: "{current:" + current + "}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            //fetch ward records
            $("#firstName").text(response.d.CarekiddieFirstName);
            $("#lastName").text(response.d.CarekiddieLastName);
            $("#otherName").text(response.d.CarekiddieOtherName);
            $("#dob").text(ToJavaScriptDate(response.d.CarekiddieDob.toString()));
            $("#bloodGroup").text(response.d.CarekiddieBloodGroup);
            $("#genotype").text(response.d.CarekiddieGenotype);
            //CarekiddiePhotoPath 

            //fetch parent records
            $("#guardianName").text(response.d.Parents.ParentFullName);
            $("#loginId").text(response.d.Parents.ParentLoginId);
            $("#phoneNumber").text(response.d.Parents.ParentContactNo);
            $("#emailAddress").text(response.d.Parents.ParentEmail);
            $("#occupation").text(response.d.Parents.Occupation);
        },
        failure: function (response) {
            console.log("error");
        }

    });
}

function addStaff() {
    $('.alert-danger').hide();
    $('.alert-success').hide();
    var $btn = $(this).button('processing');
    document.getElementById("loader").style.visibility = "visible";
    var loginName = $("#loginName").val();
    var staffEmail = $("#staffEmail").val();
    var staffPassword = $("#staffPassword").val();
    var confirmPassword = $("#confirmPassword").val();
    var gender = $('#staffGender').is(':checked') ? "Male" : "Female";
    if (loginName == "") {
        $('#message2').text("login Name cannot be empty");
        $('.alert-danger').show();
        document.getElementById("loader").style.visibility = "hidden";
        return false;
    }
    if (staffPassword == "") {
        $('#message2').text("password cannot be empty");
        $('.alert-danger').show();
        document.getElementById("loader").style.visibility = "hidden";
        return false;
    }
    if (confirmPassword == "") {
        $('#message2').text("confirm password cannot be empty");
        $('.alert-danger').show();
        document.getElementById("loader").style.visibility = "hidden";
        return false;
    }
    if (confirmPassword != confirmPassword) {
        $('#message2').text("password fields must match");
        $('.alert-danger').show();
        document.getElementById("loader").style.visibility = "hidden";
        return false;
    }
    $.ajax({
        type: "POST",
        url: "staffs.aspx/RegisterStaff",
        data: "{loginName:'" + loginName + "',staffEmail:'" + staffEmail + "',staffPassword:'"
            + staffPassword + "',gender:'" + gender + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.d.RegStatus == false) {
                document.getElementById("loader").style.visibility = "hidden";
                $('#message2').text(response.d.RegMessage);
                $('.alert-danger').show();
            }
            else {
                document.getElementById("loader").style.visibility = "hidden";
                $('#message1').text(response.d.RegMessage);
                $('.alert-success').show();
                location.reload();
            }
        },
        failure: function (response) {
            document.getElementById("loader").style.visibility = "hidden";
            $('#message2').text(response.d.RegMessage);
            $('.alert-danger').show();
        }

    });
}
//    $(document).on("click", ".app__logout", function (e) {
//        if (animating) return;
//        $(".ripple").remove();
//        animating = true;
//        var that = this;
//        $(that).addClass("clicked");
//        setTimeout(function () {
//            $app.removeClass("active");
//            $login.show();
//            $login.css("top");
//            $login.removeClass("inactive");
//        }, logoutPhase1 - 120);
//        setTimeout(function () {
//            $app.hide();
//            animating = false;
//            $(that).removeClass("clicked");
//        }, logoutPhase1);
//    });

//});