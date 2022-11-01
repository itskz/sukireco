// スライダーを生成
var swiper = new Swiper('.swiper-container', {
    loop: true, // 最後のスライドまで到達した場合、最初に戻らずに続けてスライド可能にするか

    // スライダーの自動再生
    autoplay: {
        delay: 5000, // スライドが切り替わるまでの表示時間(ミリ秒)
        disableOnInteraction: true // ユーザーのスワイプ操作を検出したら自動再生を中止するか
    },
    centeredSlides: true, //trueの場合、対象のスライドで中央寄せ（falseは左寄せ）
    slidesPerView: 1, //指定の枚数分が表示される。
    //    spaceBetween: 30,//スライドとスライドの隙間（単位：ピクセル）

    //ページネーションを表示
    pagination: {
        el: '.swiper-pagination', // ページネーションを表示するセレクタ
        type: 'bullets', //○ ● ● ● … 形式
        clickable: true //type: 'bullets'の時のみ有効
    },

    // 前後スライドへのナビゲーションを表示する場合
    navigation: {
        nextEl: '.swiper-button-next', // 次のスライドボタンのセレクタ
        prevEl: '.swiper-button-prev', // 前のスライドボタンのセレクタ
    }
});
