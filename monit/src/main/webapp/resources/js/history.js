$(document).ready(function() {

    if($(window).width() < 768) {
        $(".left_time").parent().removeClass("pl-60");
        $(".left_time").parent().addClass("mb-none");
        $(".btnCol").addClass("mb-none");
        $(".btnCol").addClass("mt-10");
        $(".changeCol").addClass("col-xs-6");
        $(".changeCol").addClass("halfDiv");
        $(".changeCol").addClass("mb-none");
        $(".changeCol").removeClass("col-md-6");
        $(".colL").removeClass("pl-30");
        $(".colR").removeClass("pr-30");
        $(".addressCol").addClass("col-xs-12");
        $(".addressCol").addClass("mb-none");
        $(".addressCol").addClass("pl-none");
        $(".addressCol").removeClass("col-md-12");
        $(".addressCol").removeClass("pl-30");
        $(".cta-content").addClass("pt-none");
        $(".cta-content").addClass("pb-none");
        $(".cta-btn").addClass("mt-none");
        $(".cta-btn").removeClass("mt-10");
        $(".cta-btn").css("padding","10px 0");
    } else if($(window).width() < 1200) {
        $(".left_time").parent().removeClass("pl-60");
        $(".left_time").parent().removeClass("col-md-6");
        $(".left_time").parent().addClass("col-md-12");
        $(".btnCol").removeClass("col-md-12");
        $(".btnCol").addClass("col-md-6");
        $(".cta-content").removeClass("pt-none");
        $(".cta-content").removeClass("pb-none");
        $(".cta-btn").removeClass("mt-none");
        $(".cta-btn").addClass("mt-10");
    }

    $( window ).resize(function() {
        if($(window).width() < 768) {
            $(".left_time").parent().removeClass("pl-60");
            $(".left_time").parent().addClass("mb-none");
            $(".btnCol").addClass("mb-none");
            $(".btnCol").addClass("mt-10");
            $(".changeCol").addClass("col-xs-6");
            $(".changeCol").addClass("halfDiv");
            $(".changeCol").addClass("mb-none");
            $(".changeCol").removeClass("col-md-6");
            $(".colL").removeClass("pl-30");
            $(".colR").removeClass("pr-30");
            $(".addressCol").addClass("col-xs-12");
            $(".addressCol").addClass("mb-none");
            $(".addressCol").addClass("pl-none");
            $(".addressCol").removeClass("col-md-12");
            $(".addressCol").removeClass("pl-30");
            $(".cta-content").addClass("pt-none");
            $(".cta-content").addClass("pb-none");
            $(".cta-btn").addClass("mt-none");
            $(".cta-btn").removeClass("mt-10");
            $(".cta-btn").css("padding","10px 0");
        } else if($(window).width() < 1200) {
            $(".changeCol").removeClass("col-xs-6");
            $(".changeCol").removeClass("halfDiv");
            $(".changeCol").removeClass("mb-none");
            $(".changeCol").addClass("col-md-6");
            $(".colL").addClass("pl-30");
            $(".colR").addClass("pr-30");
            $(".btnCol").removeClass("col-md-6");
            $(".btnCol").addClass("col-md-12");
            $(".addressCol").removeClass("col-xs-12");
            $(".addressCol").removeClass("mb-none");
            $(".addressCol").removeClass("pl-none");
            $(".addressCol").addClass("col-md-12");
            $(".addressCol").addClass("pl-30");
            $(".left_time").parent().removeClass("pl-60");
            $(".left_time").parent().removeClass("col-md-6");
            $(".left_time").parent().addClass("col-md-12");
            $(".cta-content").removeClass("pt-none");
            $(".cta-content").removeClass("pb-none");
            $(".cta-btn").removeClass("mt-none");
            $(".cta-btn").addClass("mt-10");
            $(".cta-btn").css("padding","10px 0");
        } else {
            $(".changeCol").addClass("col-md-6");
            $(".changeCol").removeClass("halfDiv");
            $(".changeCol").removeClass("mb-none");
            $(".changeCol").removeClass("col-xs-6");
            $(".btnCol").removeClass("col-md-12");
            $(".btnCol").addClass("col-md-6");
            $(".left_time").parent().removeClass("col-md-12");
            $(".left_time").parent().addClass("pl-60");
            $(".left_time").parent().addClass("col-md-6");
            $(".cta-content").removeClass("pt-none");
            $(".cta-content").removeClass("pb-none");
            $(".cta-btn").removeClass("mt-none");
            $(".cta-btn").addClass("mt-10");
            $(".cta-btn").css("padding","0");
        }
    });
});