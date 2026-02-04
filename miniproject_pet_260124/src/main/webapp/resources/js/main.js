document.addEventListener("DOMContentLoaded", function () {
    // ====== 메인 히어로 슬라이더 ======
    const slider = document.getElementById("mainHeroSlider");
    if (slider) {
        const slides = Array.from(slider.querySelectorAll(".hero-slide"));
        const dots = Array.from(document.querySelectorAll(".hero-dot"));
        const prevBtn = document.querySelector(".hero-arrow-prev");
        const nextBtn = document.querySelector(".hero-arrow-next");
        let current = 0;
        let timer = null;

        function showSlide(index) {
            slides.forEach((s, i) => {
                s.style.display = i === index ? "block" : "none";
            });
            dots.forEach((d, i) => {
                d.classList.toggle("is-active", i === index);
            });
            current = index;
        }

        function next() {
            const nextIndex = (current + 1) % slides.length;
            showSlide(nextIndex);
        }

        function prev() {
            const prevIndex = (current - 1 + slides.length) % slides.length;
            showSlide(prevIndex);
        }

        function startAuto() {
            stopAuto();
            timer = setInterval(next, 5000);
        }

        function stopAuto() {
            if (timer) {
                clearInterval(timer);
                timer = null;
            }
        }

        dots.forEach((dot, idx) => {
            dot.addEventListener("click", () => {
                showSlide(idx);
                startAuto();
            });
        });

        if (nextBtn) {
            nextBtn.addEventListener("click", () => {
                next();
                startAuto();
            });
        }
        if (prevBtn) {
            prevBtn.addEventListener("click", () => {
                prev();
                startAuto();
            });
        }

        slider.addEventListener("mouseenter", stopAuto);
        slider.addEventListener("mouseleave", startAuto);

        showSlide(0);
        startAuto();
    }

    // ====== 플로팅 툴박스: Top/Bottom ======
    const btnTop = document.getElementById("btnScrollTop");
    const btnBottom = document.getElementById("btnScrollBottom");

    if (btnTop) {
        btnTop.addEventListener("click", () => {
            window.scrollTo({ top: 0, behavior: "smooth" });
        });
    }
    if (btnBottom) {
        btnBottom.addEventListener("click", () => {
            window.scrollTo({ top: document.body.scrollHeight, behavior: "smooth" });
        });
    }

    // ====== 헤더 메가메뉴 ======
    const gnbItems = document.querySelectorAll(".gnb-item.has-mega");
    const megaWrap = document.getElementById("megaWrap");
    const megaTitle = document.getElementById("megaTitle");
    const megaDesc = document.getElementById("megaDesc");
    const megaGroups = document.querySelectorAll(".mega-group");

    const descMap = {
        home: "PetOn의 새로운 소식을 확인하세요.",
        lab: "전문가가 알려주는 믿을 수 있는 정보.",
        shop: "우리 아이를 위한 최고의 선물.",
        community: "함께 나누는 반려생활의 즐거움.",
        service: "궁금한 점은 무엇이든 물어보세요."
    };

    function isDesktop() {
        return window.innerWidth > 960;
    }

    function openMega(menuKey) {
        if (!megaWrap || !isDesktop()) return;  // 모바일에선 무시
        megaWrap.classList.add("is-open");
        megaTitle.textContent =
            menuKey === "home" ? "홈"
            : menuKey === "lab" ? "연구소"
            : menuKey === "shop" ? "쇼핑몰"
            : menuKey === "community" ? "커뮤니티"
            : "서비스";
        megaDesc.textContent = descMap[menuKey] || "";
        megaGroups.forEach(g => {
            if (g.getAttribute("data-menu") === menuKey) {
                g.classList.add("is-active");
            } else {
                g.classList.remove("is-active");
            }
        });
    }

    function closeMega() {
        if (!megaWrap) return;
        megaWrap.classList.remove("is-open");
    }

    gnbItems.forEach(item => {
        const key = item.getAttribute("data-menu");
        item.addEventListener("mouseenter", () => openMega(key));
    });

    if (megaWrap) {
        megaWrap.addEventListener("mouseleave", () => closeMega());
    }

    // ====== 모바일 GNB 토글 ======
    const btnGnbToggle = document.getElementById("btnGnbToggle");
    const gnbList = document.querySelector(".gnb-list");

    if (btnGnbToggle && gnbList) {
        btnGnbToggle.addEventListener("click", () => {
            gnbList.classList.toggle("is-open");
        });
    }
});
